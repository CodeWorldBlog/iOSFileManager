//
//  FMDocumentDependecies.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 02/07/24.
//

import Foundation

protocol FMDocumentDependencies {
    func resolveFetchDocumentUseCase() -> FMAllCategoryUseCase
    func resolveDocumentRepository() -> any FMDocumentRepository
}

extension DefaultAppDependencies {
    
    func resolveFetchDocumentUseCase() -> any FMAllCategoryUseCase {
        DefaultFMAllCategoryUseCase(dependencies: self)
    }
    
    func resolveDocumentRepository() -> any FMDocumentRepository {
        DefaultFMDocuemntRepository(dependencies: self)
    }
}
