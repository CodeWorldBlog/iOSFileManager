//
//  MTabBarCoordinatorView.swift
//  FileManager
//
//  Created by Saurav Nagpal on 24/04/23.
//

import SwiftUI

struct FMTabBarCoordinatorView: View {
    @ObservedObject var coordinator: FMTabBarCoordinator
    
    init(coordinator: FMTabBarCoordinator) {
        self.coordinator = coordinator
        let appearance = UITabBarAppearance()
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().standardAppearance = appearance
    }
    
    var body: some View {
        GeometryReader { geo in
            TabView {
                ForEach(self.coordinator.tabItems, id: \.self) { tabItem in
                    if let tabView = coordinator.viewForTabItem(tabItem) {
                        tabView.tabItem {
                            Image(tabItem.iconName ?? "")
                            Text(tabItem.title)
                        }
                    }
                }
            }.accentColor(self.coordinator.currentTheme.appColorPalette.appTintColor)
        }
    }
}

struct MTabBarCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        FMTabBarCoordinatorView(coordinator: TabBarPreviewDependency().tabbarCoordinater())
    }
}
