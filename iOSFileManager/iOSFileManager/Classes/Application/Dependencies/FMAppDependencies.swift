//
//  AppDependencies.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 12/06/24.
//

import Foundation

protocol FMAppDependencies: FMDocumentDependencies, FMAppSettingDependencies {
    var persistenceController: FMStorage { get }
}

class DefaultAppDependencies: FMAppDependencies {
    fileprivate(set) var persistenceController: FMStorage
    
    init() {
        self.persistenceController = FMCoreDataStorage(persistentController: FMPersistenceController.shared)
    }
}
