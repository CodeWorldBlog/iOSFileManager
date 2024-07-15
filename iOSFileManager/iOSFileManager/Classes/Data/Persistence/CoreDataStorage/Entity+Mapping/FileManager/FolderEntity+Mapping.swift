//
//  Folder+Mapping.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 24/06/24.
//

import Foundation

extension FolderEntity: Entity {
    typealias EntityDTO = DocumentDTO
    
    func toDTO() -> DocumentDTO? {
        guard let name = self.name, let creationTimestamp = self.creationTimestamp else {
            return nil
        }
        return DocumentDTO(name: name, size: self.size, creationTimestamp: creationTimestamp)
    }
    
    func fromDTO(entityDTO: DocumentDTO) -> Self {
        self.name = entityDTO.name
        self.creationTimestamp = entityDTO.creationTimestamp
        self.size = entityDTO.size
        return self
    }
}
