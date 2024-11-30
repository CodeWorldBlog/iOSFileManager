//
//  FMCoreDataStorage+.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 23/06/24.
//

import Foundation
import Combine
import CoreData

extension FMCoreDataStorage: FMDocumentStorage {
    func saveDocument(document: DocumentDTO) -> Future<Bool, any Error> {
        if let document = document as? FolderDTO {
            return self.saveDocument(document)
        } else if let document = document as? FileDTO {
            return self.saveFile(document)
        } else {
            return self.failureDocumentNotFound()
        }
    }
    
    func deleteDocument(document: DocumentDTO) {
        
    }
}

//MARK: - Save
fileprivate extension FMCoreDataStorage {
    func saveDocument(_ document: FolderDTO) -> Future<Bool, any Error> {
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
    func fetchAllDocuments() async -> [DocumentDTO] {
        var documentDTOs: [DocumentDTO] = []
        let backgroundContext = self.newBackgroundContext
        await backgroundContext.perform {
            let fetchRequest = DocumentEntity.fetchRequest()
            do {
                let storageUnitEntities = try backgroundContext.fetch(fetchRequest)
                storageUnitEntities.forEach { entity in
                    if let folderEntity = entity as? FolderEntity, let folderDTO = folderEntity.toDTO() {
                        documentDTOs.append(folderDTO)
                    } else if let fileEntity = entity as? FileEntity, let fileDTO = fileEntity.toDTO() {
                        documentDTOs.append(fileDTO)
                    }
                }
            } catch {
                debugPrint("CoreDataResponseStorage Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
        return documentDTOs
    }
    
    func fetchAllCatgeories() async -> [CategoryDTO] {
        var categoryDTOs: [CategoryDTO] = []
        let backgroundContext = self.newBackgroundContext
        await backgroundContext.perform {
            let fetchRequest = CategoryEntity.fetchRequest()
            do {
                let storageUnitEntities = try backgroundContext.fetch(fetchRequest)
                storageUnitEntities.forEach { categoryEntity in
                    if let dto = categoryEntity.toDTO() {
                        categoryDTOs.append(dto)
                    }
                    
                }
            } catch {
                debugPrint("CoreDataResponseStorage Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
        return categoryDTOs
    }
    
    func fetchAllFiles() async -> [FileDTO] {
        var files: [FileDTO] = []
        let backgroundContext = self.newBackgroundContext
        await backgroundContext.perform {
            let fetchRequest: NSFetchRequest<FileEntity> = FileEntity.fetchRequest()
            do {
                let storageUnitEntities = try backgroundContext.fetch(fetchRequest)
                storageUnitEntities.forEach { categoryEntity in
                    if let dto = categoryEntity.toDTO() {
                        files.append(dto)
                    }
                    
                }
            } catch {
                debugPrint("CoreDataResponseStorage Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
        return files
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
