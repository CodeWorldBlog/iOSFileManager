//
//  AppCoordinator.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 12/06/24.
//

import Foundation

class AppCoordinator: Coordinator {
    var appNavigationState: FMAppNavigationState
    private var appDependencies: FMAppDependencies
    private(set) var tabbarCoordinator: FMTabBarCoordinator?
    
    init() {
        self.appDependencies = DefaultAppDependencies()
        self.appNavigationState = FMAppNavigationState()
        self.tabbarCoordinator = self.getTabbarCoordinator()
    }
}

fileprivate extension AppCoordinator {
    func getTabbarCoordinator() -> FMTabBarCoordinator {
        return FMTabBarCoordinator(dependencies: self.appDependencies, appNavigationState: self.appNavigationState)
    }
}
