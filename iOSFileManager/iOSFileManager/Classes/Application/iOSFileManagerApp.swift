//
//  iOSFileManagerApp.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 10/06/24.
//

import SwiftUI

@main
struct iOSFileManagerApp: App {
    let appCoordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(coordinator: appCoordinator)
        }
    }
}
