//
//  ASQuery.swift
//  Awakening Stories
//
//  Created by Saurav Nagpal on 19/01/23.
//

import Foundation

protocol ASQuery {
    func saveEntity<T: Entity>(entity: T) -> Bool
    func fetchEntity<T: Entity>() -> T
}
