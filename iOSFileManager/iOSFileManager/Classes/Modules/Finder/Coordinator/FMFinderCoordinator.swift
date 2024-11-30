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
    lazy private(set) var feedDependencies: FMFinderDependencies = {
        let actions = FMFinderCoordinatorAction(displayDocument: self.displayDocument)
        return DefaultFMFinderDependencies(dependencies: self.appDependencies, coordActions: actions)
    }()
    fileprivate(set) var appNavigationState: FMAppNavigationState
    @Published var displayDocument: Bool = false
    fileprivate(set) var documentCoordinater: FMDocumentCoordinator?
    
    init(dependencies: FMAppDependencies, appNavigationState: FMAppNavigationState) {
        self.appDependencies = dependencies
        self.appNavigationState = appNavigationState
    }
    
    func displayDocument(_ document: FMDocument) {
        self.documentCoordinater = FMDocumentCoordinator(dependencies: self.appDependencies, appNavigationState: self.appNavigationState)
        self.displayDocument = true
        
    }
}

