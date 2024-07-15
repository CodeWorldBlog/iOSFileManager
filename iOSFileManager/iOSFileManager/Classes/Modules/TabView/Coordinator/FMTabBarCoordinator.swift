//
//  MTabBarCoordinator.swift
//  FileManager
//
//  Created by Saurav Nagpal on 24/04/23.
//

import Foundation
import SwiftUI

class FMTabBarCoordinator: Coordinator, FMThemeable {
    fileprivate(set) var appNavigationState: FMAppNavigationState
    private let tabDependencies: FMTabBarDependencies
    private(set) var tabItems: [FMTabItem] = []
    private var childViews: [any FMTabChildView] = [] {
        didSet {
            self.setupTabItems()
        }
    }
    
    init(dependencies: FMAppDependencies, appNavigationState: FMAppNavigationState) {
        self.tabDependencies = DefaultFMTabBarDependencies(dependencies: dependencies)
        self.appNavigationState = appNavigationState
        self.setupTabDICoordinator()
       
    }
    
    func apply(theme: FMTheme) {
        
    }
    
    func viewForTabItem(_ tabItem: FMTabItem) -> AnyView? {
        guard let tabCoordinatorView = childViews.filter({$0.tabItem.tabName == tabItem.tabName }).first else {
            return nil
        }
        return AnyView(tabCoordinatorView)
    }
}

fileprivate extension FMTabBarCoordinator {
    func setupTabItems() {
        var tabItems: [FMTabItem] = []
        for childView in childViews {
            tabItems.append(childView.tabItem)
        }
        self.tabItems = tabItems
    }
    
    func setupTabDICoordinator() {
        var coordinators: [any FMTabChildView] = []
        for tabName in self.tabDependencies.supportedTabbarItems {
            switch tabName {
            case .finder:
                let homeCoard = self.finderCoordinator()
                coordinators.append(homeCoard)
            case .scanner:
                let addScannerCoard = self.scannerViewCoordinator()
                coordinators.append(addScannerCoard)
            case .settings:
                let addScannerCoard = self.settingViewCoordinator()
                coordinators.append(addScannerCoard)
            }
        }
        self.childViews = coordinators
    }
}

fileprivate extension FMTabBarCoordinator {
    func finderCoordinator() -> any FMTabChildView {
        return FMFinderCoordinatorView(coordinator: self.tabDependencies.resolveFinderCoordinator(navigationState: self.appNavigationState))
    }
    
    func scannerViewCoordinator() -> any FMTabChildView {
        return FMScannerCoordinatorView(coordinator: self.tabDependencies.resolveScannerCoordinator(navigationState: self.appNavigationState))
    }
    
    func settingViewCoordinator() -> any FMTabChildView {
        return FMSettingCoordinatorView(coordinator: self.tabDependencies.resolveSettingCoordinator(navigationState: self.appNavigationState))
    }
}
