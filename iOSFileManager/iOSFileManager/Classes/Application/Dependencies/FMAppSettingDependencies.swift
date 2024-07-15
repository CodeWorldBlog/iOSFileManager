//
//  FMAppSettingDependencies.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 02/07/24.
//

import Foundation

protocol FMAppSettingDependencies {
    func resolveFetchSettingUseCase() -> FMSettingUseCase
    func resolveSettingRepository() -> FMSettingRepository
}

extension DefaultAppDependencies {
    
    func resolveFetchSettingUseCase() -> any FMSettingUseCase {
        DefaultFMSettingUseCase(dependencies: self)
    }
    
    func resolveSettingRepository() -> any FMSettingRepository {
        DefaultFMSettingRepository(dependencies: self)
    }
}
