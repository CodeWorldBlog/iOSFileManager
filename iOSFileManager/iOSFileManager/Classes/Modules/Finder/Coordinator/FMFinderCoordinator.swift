//
//  MFeedCoordinator.swift
//  FileManager
//
//  Created by Saurav Nagpal on 26/04/23.
//

import Foundation
import SwiftUI

class FMFinderCoordinator: Coordinator {
    private let appDependencies: FMAppDependencies
    private(set) var feedDependencies: FMFinderDependencies
    fileprivate(set) var appNavigationState: FMAppNavigationState
    @UserDefaultPersist(defaultKey: "isCoachMarkShown", defaultValue: false) var isCoachMarkShown: Bool?
    @AtomicPropertyWrapper var counter: Int = 1
    
    init(dependencies: FMAppDependencies, appNavigationState: FMAppNavigationState) {
        self.appDependencies = dependencies
        self.feedDependencies = DefaultFMFinderDependencies(dependencies: dependencies)
        self.appNavigationState = appNavigationState
        _isCoachMarkShown.wrappedValue = true
    }

}

