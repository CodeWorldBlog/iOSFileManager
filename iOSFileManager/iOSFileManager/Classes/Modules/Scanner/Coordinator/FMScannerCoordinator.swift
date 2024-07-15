//
//  MAddFeedCoordinator.swift
//  FileManager
//
//  Created by Saurav Nagpal on 22/05/23.
//

import Foundation
import SwiftUI

class FMScannerCoordinator: Coordinator {
    let dependencies: FMAppDependencies
    lazy var addFeedDependencies: FMScannerDependencies = {
        return DefaultFMScannerDependencies(dependencies: dependencies)
    }()
    fileprivate(set) var appNavigationState: FMAppNavigationState
    
    init(dependencies: FMAppDependencies, appNavigationState: FMAppNavigationState) {
        self.appNavigationState = appNavigationState
        self.dependencies = dependencies
    }
}
