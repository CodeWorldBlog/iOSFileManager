//
//  File+Mapping.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 24/06/24.
//

import Foundation

extension FileEntity: Entity {
    typealias EntityDTO = FileDTO

    func toDTO() -> FileDTO? {
        guard let name = self.name, let creationTimestamp = self.createdAt else {
            return nil
        }
        return FileDTO(name: name, size: self.size, creationTimestamp: creationTimestamp)
    }
    
    func fromDTO(entityDTO: FileDTO) -> Self {
        self.name = entityDTO.name
        self.createdAt = entityDTO.creationTimestamp
        self.size = entityDTO.size
        return self
    }
}
