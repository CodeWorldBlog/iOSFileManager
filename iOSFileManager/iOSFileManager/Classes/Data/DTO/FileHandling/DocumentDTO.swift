//
//  DocumentDTO.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 23/06/24.
//

import Foundation

struct DocumentDTO: StorageUnitDTO {
    fileprivate(set) var creationTimestamp: Date
    fileprivate(set) var name: String
    fileprivate(set) var size: Double
    
    init(name: String, size: Double, creationTimestamp: Date) {
        self.name = name
        self.size = size
        self.creationTimestamp = creationTimestamp
    }
}
