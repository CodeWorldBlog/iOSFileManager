//
//  MTabBarDIContainer.swift
//  FileManager
//
//  Created by Saurav Nagpal on 26/04/23.
//

import Foundation

enum FileManagerTab {
    case finder
    case scanner
    case settings
    
    var defaultIconName: String {
        switch self {
        case .finder:
            return "finder"
        case .scanner:
            return "scanner"
        case .settings:
            return "setting"
        }
    }
    
    var defaultTitleName: String {
        switch self {
        case .finder:
            return TabLocalization.finderTabTitle
        case .scanner:
            return TabLocalization.scannerTabTitle
        case .settings:
            return TabLocalization.settingTabTitle
        }
    }
}

protocol FMTabBarDependencies {
    var supportedTabbarItems: [FileManagerTab] { get }
    func resolveFinderCoordinator(navigationState: FMAppNavigationState) -> FMFinderCoordinator
    func resolveScannerCoordinator(navigationState: FMAppNavigationState) -> FMScannerCoordinator
    func resolveSettingCoordinator(navigationState: FMAppNavigationState) -> FMSettingCoordinator
}

final class DefaultFMTabBarDependencies: FMTabBarDependencies {
    let dependencies: FMAppDependencies
    let supportedTabbarItems: [FileManagerTab]
    
    init(dependencies: FMAppDependencies) {
        self.dependencies = dependencies
        self.supportedTabbarItems = [FileManagerTab.finder, FileManagerTab.scanner, FileManagerTab.settings]
    }
    
    func resolveFinderCoordinator(navigationState: FMAppNavigationState) -> FMFinderCoordinator {
        return FMFinderCoordinator(dependencies: dependencies, appNavigationState: navigationState)
    }
    
    func resolveScannerCoordinator(navigationState: FMAppNavigationState) -> FMScannerCoordinator {
        return FMScannerCoordinator(dependencies: dependencies, appNavigationState: navigationState)
    }
    
    func resolveSettingCoordinator(navigationState: FMAppNavigationState) -> FMSettingCoordinator {
        return FMSettingCoordinator(dependencies: dependencies, appNavigationState: navigationState)
    }
}

