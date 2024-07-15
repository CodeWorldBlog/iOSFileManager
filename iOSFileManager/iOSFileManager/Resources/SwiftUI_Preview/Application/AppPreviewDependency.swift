//
//  AppPreviewDependency.swift
//  FileManager
//
//  Created by Saurav Nagpal on 07/05/23.
//

import Foundation

class AppPreviewDependency: FMAppDependencies {
    var persistenceController: any FMStorage
    
    init() {
        self.persistenceController = FMCoreDataStorage(persistentController: FMPersistenceController.shared)
    }
    
    func appCoordinater() -> AppCoordinator {
        return AppCoordinator()
    }
    
    func resolveFetchDocumentUseCase() -> any FMAllDocumentUseCase {
        DefaultFMAllDocumentUseCase(dependencies: self)
    }
    
    func resolveDocumentRepository() -> any FMDocuemntRepository {
        DefaultFMDocuemntRepository(dependencies: self)
    }
    
    func resolveFetchSettingUseCase() -> any FMSettingUseCase {
        DefaultFMSettingUseCase(dependencies: self)
    }
    
    func resolveSettingRepository() -> any FMSettingRepository {
        DefaultFMSettingRepository(dependencies: self)
    }
    
}
