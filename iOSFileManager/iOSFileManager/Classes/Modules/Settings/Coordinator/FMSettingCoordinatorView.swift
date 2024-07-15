//
//  MLoginCoordinatorView.swift
//  FileManager
//
//  Created by Saurav Nagpal on 06/03/24.
//

import SwiftUI

struct FMSettingCoordinatorView: View, FMTabChildView {
    @StateObject var coordinator: FMSettingCoordinator
    
    var tabItem: FMTabItem {
        return FMTabItem(tabName: .settings)
    }
    
    var body: some View {
        NavigationView {
            FMSettingView(viewModel: coordinator.settingDependencies.resolveLoginViewModel())
        }
    }
}

