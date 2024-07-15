//
//  FMCoreDataStorage+.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 23/06/24.
//

import Foundation
import Combine

extension FMCoreDataStorage: FMDocumentStorage {
    func saveDocument(document: StorageUnitDTO) -> Future<Bool, any Error> {
        if let document = document as? DocumentDTO {
            return self.saveDocument(document)
        } else if let document = document as? FileDTO {
            return self.saveFile(document)
        } else {
            return self.failureDocumentNotFound()
        }
    }
    
    func deleteDocument(document: StorageUnitDTO) {
        
    }
}

//MARK: - Save
fileprivate extension FMCoreDataStorage {
    func saveDocument(_ document: DocumentDTO) -> Future<Bool, any Error> {
        Future { promise in
            self.persistentController.performBackgroundTask { context in
                _ = FolderEntity(context: context).fromDTO(entityDTO: document)
                do {
                    try context.save()
                    promise(.success(true))
                } catch {
                    debugPrint("CoreDataMoviesResponseStorage Unresolved error \(error), \((error as NSError).userInfo)")
                    promise(.failure(error))
                }
            }
        }
    }
    
    func saveFile(_ document: FileDTO) -> Future<Bool, any Error> {
        Future { promise in
            self.persistentController.performBackgroundTask { context in
                _ = FileEntity(context: context).fromDTO(entityDTO: document)
                do {
                    try context.save()
                    promise(.success(true))
                } catch {
                    debugPrint("CoreDataMoviesResponseStorage Unresolved error \(error), \((error as NSError).userInfo)")
                    promise(.failure(error))
                }
            }
        }
    }
}

//MARK: - Fetch Document
extension FMCoreDataStorage {
    func fetchAllDocuments() async -> [StorageUnitDTO] {
        var storageDTOs: [StorageUnitDTO] = []
        let backgroundContext = self.newBackgroundContext
        await backgroundContext.perform {
            let fetchRequest = StorageUnitEntity.fetchRequest()
            do {
                let storageUnitEntities = try backgroundContext.fetch(fetchRequest)
                storageUnitEntities.forEach { entity in
                    if let folderEntity = entity as? FolderEntity, let folderDTO = folderEntity.toDTO() {
                        storageDTOs.append(folderDTO)
                    } else if let fileEntity = entity as? FileEntity, let fileDTO = fileEntity.toDTO() {
                        storageDTOs.append(fileDTO)
                    }
                }
            } catch {
                debugPrint("CoreDataResponseStorage Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
        return storageDTOs
    }
}

//MARK: - Success & Failure
fileprivate extension FMCoreDataStorage {
    func failureDocumentNotFound() -> Future<Bool, any Error> {
        return Future { promise in
            promise(.failure(FMError.documentNotFound))
        }
    }
}
