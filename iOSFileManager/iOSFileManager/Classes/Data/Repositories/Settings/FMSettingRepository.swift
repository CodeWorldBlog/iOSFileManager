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
    func fetchAppSettings() async -> [FMSettings]
}

class DefaultFMSettingRepository: FMSettingRepository {
    
    var settingLocalStorage: FMSettingStorage
    private var settingStore = Set<AnyCancellable>()
    
    init(dependencies: FMAppDependencies) {
        self.settingLocalStorage = dependencies.persistenceController
    }
    
    
    func fetchAppSettings() async -> [FMSettings] {
        let settingDTOs = await self.settingLocalStorage.fetchAllSettings()
        return self.settingsFromDTOs(settingDTOs)
    }
}


fileprivate extension DefaultFMSettingRepository {
    func settingsFromDTOs(_ dtos: [SettingDTO]) -> [FMSettings] {
        var settigns: [FMSettings] = []
        for dto in dtos {
            
        }
        return settigns
    }
}
