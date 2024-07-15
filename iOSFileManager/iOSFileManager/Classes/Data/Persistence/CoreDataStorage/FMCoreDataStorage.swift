//
//  FMCoreDataStorage.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 23/06/24.
//

import Foundation
import CoreData
import Combine

class FMCoreDataStorage {
    //MARK: - iVar
    let persistentController: FMPersistenceController
    var viewcontext: NSManagedObjectContext {
        return persistentController.container.viewContext
    }
    
    var newBackgroundContext: NSManagedObjectContext {
        let context = persistentController.container.newBackgroundContext()
        context.automaticallyMergesChangesFromParent = true
        return context
    }
    
    //MARK: - Life Cycle
    init(persistentController: FMPersistenceController) {
        self.persistentController = persistentController
    }
    
    func saveContext(_ context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            debugPrint("CoreDataMoviesResponseStorage Unresolved error \(error), \((error as NSError).userInfo)")
        }
    }
}
