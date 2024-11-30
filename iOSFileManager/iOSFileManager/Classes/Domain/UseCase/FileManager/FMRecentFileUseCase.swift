//
//  FMRecentFileUseCase.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 30/10/24.
//

import Foundation

protocol FMRecentFileUseCase {
    func fetchAllRecentFiles() async -> [FMFile]
}

class DefaultFMRecentFileUseCase: FMRecentFileUseCase {
    fileprivate var repository: FMDocumentRepository
   
    init(dependencies: FMDocumentDependencies) {
        self.repository = dependencies.resolveDocumentRepository()
    }
    
    func fetchAllRecentFiles() async -> [FMFile] {
        var files: [FMFile] = []
        let fileDTOs = await repository.fecthAllFiles()
        for fileDTO in fileDTOs {
            let file = FMFile(dto: fileDTO)
            files.append(file)
        }
        return files
    }
}

