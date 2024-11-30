
//
//  FMAllDocumentUseCase.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 30/06/24.
//

import Foundation
import Combine

protocol FMAllFolderUseCase {
    func fetchAllDocument() async -> [FMDocument]
}

class DefaultFMFolderDocumentUseCase: FMAllFolderUseCase {
    fileprivate var repository: FMDocumentRepository
   
    init(dependencies: FMDocumentDependencies) {
        self.repository = dependencies.resolveDocumentRepository()
    }
    
    func fetchAllDocument() async -> [FMDocument] {
        var storageUnits = Array<FMDocument>()
        var documentDTOs =  await self.repository.fecthAllDocuments()
        if documentDTOs.isEmpty {
            documentDTOs = self.defaultFMFolders()
        }
        
        for documentDTO in documentDTOs {
            if let folderDTO = documentDTO as? FolderDTO {
                storageUnits.append(FMFolder(dto: folderDTO))
            } else if let fileDTO = documentDTO as? FileDTO {
                storageUnits.append(FMFile(dto: fileDTO))
            }
        }
        return storageUnits
    }
}

fileprivate extension DefaultFMFolderDocumentUseCase {
    func defaultFMFolders() -> [FolderDTO] {
        let emptyDocumentSize: Double = 0
        var defaultDocuments: [FolderDTO] = []
        for folder in FMDefaultFolder.allCases {
            let document = FolderDTO(name: folder.name, size: emptyDocumentSize, creationTimestamp: Date.now, icon: folder.icon)
            defaultDocuments.append(document)
        }
        return defaultDocuments
    }
}
