//
//  MyFeedDiContainer.swift
//  FileManager
//
//  Created by Saurav Nagpal on 26/04/23.
//

import Foundation

struct FMFinderCoordinatorAction {
    let displayDocument: ((_ document: FMDocument) -> Void)
}

protocol FMFinderDependencies {
    var coordActions: FMFinderCoordinatorAction { get }
    func resolveFinderContentViewModel() -> FMFinderContentViewModel
    func resolveFetchDocumentUseCase() -> any FMAllFolderUseCase
    func resolveFetchCategoryUseCase() -> any FMAllCategoryUseCase
    func resolveRecentDependenciesUseCase() -> any FMRecentFileUseCase
}

final class DefaultFMFinderDependencies: FMFinderDependencies {
    var coordActions: FMFinderCoordinatorAction
    let dependencies: FMAppDependencies
    
    init(dependencies: FMAppDependencies, coordActions: FMFinderCoordinatorAction) {
        self.dependencies = dependencies
        self.coordActions = coordActions
    }
    
    // MARK: - ViewModel
    func resolveFinderContentViewModel() -> FMFinderContentViewModel {
        return FMFinderContentViewModel(dependencies: self)
    }
    
    func resolveFetchDocumentUseCase() -> FMAllFolderUseCase {
        return DefaultFMFolderDocumentUseCase(dependencies: self.dependencies)
    }
    
    func resolveFetchCategoryUseCase() -> any FMAllCategoryUseCase {
        return DefaultFMAllCategoryUseCase(dependencies: self.dependencies)
    }
    
    func resolveRecentDependenciesUseCase() -> any FMRecentFileUseCase {
        return DefaultFMRecentFileUseCase(dependencies: self.dependencies)
    }
}

extension DefaultFMFinderDependencies {
}
