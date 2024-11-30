//
//  Folder+Mapping.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 24/06/24.
//

import Foundation

extension FolderEntity: Entity {
    typealias EntityDTO = FolderDTO
    
    func toDTO() -> FolderDTO? {
        guard let name = self.name, let creationTimestamp = self.createdAt else {
            return nil
        }
        return FolderDTO(name: name, size: self.size, creationTimestamp: creationTimestamp)
    }
    
    func fromDTO(entityDTO: FolderDTO) -> Self {
        self.name = entityDTO.name
        self.createdAt = entityDTO.creationTimestamp
        self.size = entityDTO.size
        return self
    }
}
