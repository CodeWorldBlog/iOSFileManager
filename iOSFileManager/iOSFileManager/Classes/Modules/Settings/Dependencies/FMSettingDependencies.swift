//
//  MLoginDependencies.swift
//  FileManager
//
//  Created by Saurav Nagpal on 06/03/24.
//

import Foundation

protocol FMSettingDependencies {
    var appDependencies: FMAppDependencies { get }
    func resolveLoginViewModel() -> FMSettingViewModel
    func resolveSettingUseCase() -> FMSettingRepository
    func resolveSettingRepository() -> FMSettingRepository
}

final class DefaultFMSettingDependencies: FMSettingDependencies {
    let appDependencies: FMAppDependencies
    
    init(dependencies: FMAppDependencies) {
        self.appDependencies = dependencies
    }
    
    func resolveLoginViewModel() -> FMSettingViewModel {
        FMSettingViewModel(dependencies: self)
    }
    
    func resolveSettingUseCase() -> FMSettingRepository {
        DefaultFMSettingRepository(dependencies: self.appDependencies)
    }
    
    func resolveSettingRepository() -> FMSettingRepository {
        DefaultFMSettingRepository(dependencies: self.appDependencies)
    }
}
