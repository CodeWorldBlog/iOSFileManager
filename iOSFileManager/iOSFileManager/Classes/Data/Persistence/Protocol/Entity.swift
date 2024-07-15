//
//  Entity.swift
//  Awakening Stories
//
//  Created by Saurav Nagpal on 18/01/23.
//

import Foundation

protocol Entity {
    associatedtype EntityDTO
    func toDTO() -> EntityDTO?
    func fromDTO(entityDTO: EntityDTO) -> Self
}
