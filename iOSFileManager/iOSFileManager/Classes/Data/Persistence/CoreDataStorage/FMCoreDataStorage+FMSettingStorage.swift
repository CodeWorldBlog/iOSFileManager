//
//  FMCoreDataStorage+FMSettingStorage.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 02/07/24.
//

import Foundation
import Combine

extension FMCoreDataStorage: FMSettingStorage {
    func fetchAllSettings() async -> [SettingDTO] {
        var settings: [SettingDTO] = []
        let backgroundContext = self.newBackgroundContext
        await backgroundContext.perform {
            let fetchRequest = SettingEntity.fetchRequest()
            do {
                let feedEntities = try backgroundContext.fetch(fetchRequest)
                feedEntities.forEach { entity in
                    if let setting = entity.toDTO() {
                        settings.append(setting)
                    }
                }
            } catch {
                debugPrint("CoreDataResponseStorage Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
        return settings
    }
}
