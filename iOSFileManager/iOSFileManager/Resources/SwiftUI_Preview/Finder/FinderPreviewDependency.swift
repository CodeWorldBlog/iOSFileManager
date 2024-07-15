//
//  FeedDependency.swift
//  FileManager
//
//  Created by Saurav Nagpal on 07/05/23.
//

import Foundation

class FinderPreviewDependency {
    let previewDepdendency = AppPreviewDependency()
    let appNavigationState = FMAppNavigationState()
    
    func finderContentViewModel() -> FMFinderContentViewModel {
        return self.finderDependencies().resolveFinderContentViewModel()
    }
    
    func finderDependencies() -> FMFinderDependencies {
        return DefaultFMFinderDependencies(dependencies: previewDepdendency)
    }
    
    func finderCoordinater() -> FMFinderCoordinator{
        return FMFinderCoordinator(dependencies: self.previewDepdendency, appNavigationState: self.appNavigationState)
    }
}
