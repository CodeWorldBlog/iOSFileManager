//
//  FMDocumentDependecies.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 02/07/24.
//

import Foundation

protocol FMDocumentDependencies {
    func resolveFetchDocumentUseCase() -> FMAllDocumentUseCase
    func resolveDocumentRepository() -> any FMDocuemntRepository
}

extension DefaultAppDependencies {
    
    func resolveFetchDocumentUseCase() -> any FMAllDocumentUseCase {
        DefaultFMAllDocumentUseCase(dependencies: self)
    }
    
    func resolveDocumentRepository() -> any FMDocuemntRepository {
        DefaultFMDocuemntRepository(dependencies: self)
    }
}
