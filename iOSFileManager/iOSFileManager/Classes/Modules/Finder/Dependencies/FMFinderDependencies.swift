//
//  MyFeedDiContainer.swift
//  FileManager
//
//  Created by Saurav Nagpal on 26/04/23.
//

import Foundation

protocol FMFinderDependencies {
    func resolveFinderContentViewModel() -> FMFinderContentViewModel
}

final class DefaultFMFinderDependencies: FMFinderDependencies {
    let dependencies: FMAppDependencies
    
    init(dependencies: FMAppDependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - ViewModel
    func resolveFinderContentViewModel() -> FMFinderContentViewModel {
        return FMFinderContentViewModel(dependencies: self)
    }
}

extension DefaultFMFinderDependencies {
}
