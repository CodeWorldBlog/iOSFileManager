//
//  FMDocumentViewDependencies.swift
//  FileManager
//
//  Created by Saurav Nagpal on 24/05/23.
//

import Foundation

protocol FMDocumentViewDependencies {
    func resolveDocumentViewModel() -> FMDocumentViewModel
}

final class DefaultFMDocumentViewDependencies: FMDocumentViewDependencies {
    private let dependencies: FMAppDependencies
    
    init(dependencies: FMAppDependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - ViewModel
    func resolveDocumentViewModel() -> FMDocumentViewModel {
        return FMDocumentViewModel(documentDependencies: self)
    }
}

