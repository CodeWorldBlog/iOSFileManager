//
//  MNoticeRepository.swift
//  FileManager
//
//  Created by Saurav Nagpal on 15/05/23.
//

import Foundation
import Combine

protocol FMSettingRepository {
    //MARK: - Data object
    var settingLocalStorage: FMSettingStorage { get  }
    
    //MARK: - Methods
    
    ///
    /// - Return:
    ///   - success: Event fired in success case
    ///   - failure: Event fired in failure case
    func fetchAppSettings() async -> [FMSetting]
}

class DefaultFMSettingRepository: FMSettingRepository {
    
    var settingLocalStorage: FMSettingStorage
    private var settingStore = Set<AnyCancellable>()
    
    init(dependencies: FMAppDependencies) {
        self.settingLocalStorage = dependencies.persistenceController
    }
    
    
    func fetchAppSettings() async -> [FMSetting] {
        let settingDTOs = await self.settingLocalStorage.fetchAllSettings()
        return self.settingsFromDTOs(settingDTOs)
    }
}


fileprivate extension DefaultFMSettingRepository {
    func settingsFromDTOs(_ dtos: [SettingDTO]) -> [FMSetting] {
        var settigns: [FMSetting] = []
        for dto in dtos {
            
        }
        return settigns
    }
}
