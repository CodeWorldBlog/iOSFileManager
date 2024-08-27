//
//  FMSettingUseCase.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 30/06/24.
//

import Foundation
import Combine

protocol FMSettingUseCase {
    func fetchAllSettings() async -> [FMSettings]
}

class DefaultFMSettingUseCase: FMSettingUseCase {
    fileprivate var repository: FMSettingRepository
   
    init(dependencies: FMAppSettingDependencies) {
        self.repository = dependencies.resolveSettingRepository()
    }
    
    func fetchAllSettings() async -> [FMSettings] {
        return await self.repository.fetchAppSettings()
    }
}
