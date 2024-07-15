//
//  TabBarDependency.swift
//  FileManager
//
//  Created by Saurav Nagpal on 07/05/23.
//

import Foundation

class TabBarPreviewDependency {
    let previewDepdendency = AppPreviewDependency()
    var appNavigationState = FMAppNavigationState()
    
    func tabbarDIContainer() -> FMTabBarDependencies {
        return DefaultFMTabBarDependencies(dependencies: self.previewDepdendency)
    }
    
    func tabbarCoordinater() -> FMTabBarCoordinator {
        return FMTabBarCoordinator(dependencies: self.previewDepdendency, appNavigationState: self.appNavigationState)
    }
}
