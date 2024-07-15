//
//  AppCoordinatorView.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 24/06/24.
//

import SwiftUI

struct AppCoordinatorView: View {
    @ObservedObject var coordinator: AppCoordinator
    var body: some View {
        if let tabbarCoordinator = coordinator.tabbarCoordinator {
            FMTabBarCoordinatorView(coordinator: tabbarCoordinator)
        }
        
    }
}

#Preview {
    AppCoordinatorView(coordinator: AppPreviewDependency().appCoordinater())
}
