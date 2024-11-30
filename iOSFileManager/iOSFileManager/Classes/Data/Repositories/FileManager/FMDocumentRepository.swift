//
//  MLoginRepository.swift
//  FileManager
//
//  Created by Saurav Nagpal on 08/03/24.
//

import Foundation
import Combine


protocol FMDocumentRepository {
    
    var documentStorage: FMDocumentStorage { get  }
    //MARK: - Methods
    ///
    ///
    /// - Return:
    ///   - success: Event fired in success case
    ///   - failure: Event fired in failure case
    func savDocument(document: FMDocument) async -> Future<Bool, FMError>
    func fecthAllCategories() async -> [CategoryDTO]
    func fecthAllDocuments() async -> [DocumentDTO]
    func fecthAllFiles() async -> [FileDTO]
}


class DefaultFMDocuemntRepository: FMDocumentRepository {
    
    fileprivate(set) var documentStorage: FMDocumentStorage
    
    init(dependencies: FMAppDependencies) {
        self.documentStorage = dependencies.persistenceController
    }
    
}

//MARK: - Save
extension DefaultFMDocuemntRepository {
    func savDocument(document: FMDocument) async -> Future<Bool, FMError> {
        let response = Future<Bool, FMError> { promise in
            promise(.success(true))
        }
        return response
    }
}

//MARK: - Fetch Document
extension DefaultFMDocuemntRepository {
    func fecthAllCategories() async -> [CategoryDTO] {
        return await self.documentStorage.fetchAllCatgeories()
    }
    
    func fecthAllDocuments() async -> [DocumentDTO] {
        return await self.documentStorage.fetchAllDocuments()
    }
    
    func fecthAllFiles() async -> [FileDTO] {
        return await self.documentStorage.fetchAllFiles()
    }
}
