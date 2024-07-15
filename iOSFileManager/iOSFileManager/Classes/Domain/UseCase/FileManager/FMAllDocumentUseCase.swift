//
//  FMAllDocumentUseCase.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 30/06/24.
//

import Foundation
import Combine

protocol FMAllDocumentUseCase {
    func fetchAllDocument() async -> [FMStorageUnit]
}

class DefaultFMAllDocumentUseCase: FMAllDocumentUseCase {
    fileprivate var repository: FMDocuemntRepository
   
    init(dependencies: FMDocumentDependencies) {
        self.repository = dependencies.resolveDocumentRepository()
    }
    
    func fetchAllDocument() async -> [FMStorageUnit] {
        var storageUnits = Array<FMStorageUnit>()
        let documentDTOs =  await self.repository.fecthAllDocuments()
        for documentDTO in documentDTOs {
            if let folderDTO = documentDTO as? DocumentDTO {
                storageUnits.append(FMDocument(dto: folderDTO))
            } else if let fileDTO = documentDTO as? FileDTO {
                storageUnits.append(FMFile(dto: fileDTO))
            }
        }
        return storageUnits
    }
}
