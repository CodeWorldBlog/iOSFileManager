//
//  MLoginCoordinator.swift
//  FileManager
//
//  Created by Saurav Nagpal on 06/03/24.
//

import Foundation

class FMSettingCoordinator: ObservableObject {
    private let appDependencies: FMAppDependencies
    private(set) lazy var settingDependencies: FMSettingDependencies = {
        return DefaultFMSettingDependencies(dependencies: self.appDependencies)
    }()
    
    init(dependencies: FMAppDependencies, appNavigationState: FMAppNavigationState) {
        self.appDependencies = dependencies
    }
}

//MARK: - Action
fileprivate extension FMSettingCoordinator {

}
