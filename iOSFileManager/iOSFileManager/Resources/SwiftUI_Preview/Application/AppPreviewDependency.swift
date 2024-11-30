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
    
    
    func resolveFetchDocumentUseCase() -> any FMAllCategoryUseCase {
        DefaultFMAllCategoryUseCase(dependencies: self)
    }
    
    func resolveFetchDocumentUseCase() -> any FMAllFolderUseCase {
        DefaultFMFolderDocumentUseCase(dependencies: self)
    }
    
    
    func resolveDocumentRepository() -> any FMDocumentRepository {
        DefaultFMDocuemntRepository(dependencies: self)
    }
    
    func resolveFetchSettingUseCase() -> any FMSettingUseCase {
        DefaultFMSettingUseCase(dependencies: self)
    }
    
    func resolveSettingRepository() -> any FMSettingRepository {
        DefaultFMSettingRepository(dependencies: self)
    }
    
}
