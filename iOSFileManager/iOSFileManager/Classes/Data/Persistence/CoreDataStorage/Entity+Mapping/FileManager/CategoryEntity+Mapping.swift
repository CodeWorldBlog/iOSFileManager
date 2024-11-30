//
//  CategoryEntity+Mapping.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 29/10/24.
//

import Foundation

extension CategoryEntity: Entity {
    typealias EntityDTO = CategoryDTO
    func toDTO() -> CategoryDTO? {
        guard let name = self.name else {
            return nil
        }
        return CategoryDTO(name: name, icon: self.icon)
    }
    
    func fromDTO(entityDTO: CategoryDTO) -> Self {
        self.name = entityDTO.name
        self.icon = entityDTO.icon
        return self
    }
}
