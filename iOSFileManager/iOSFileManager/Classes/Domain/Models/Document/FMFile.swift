//
//  FMFile.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 30/06/24.
//

import Foundation

class FMFile: FMStorageUnit {
    fileprivate(set) var creationTimestamp: Date
    fileprivate(set) var name: String
    fileprivate(set) var size: Double
    
    init(dto: FileDTO) {
        self.creationTimestamp = dto.creationTimestamp
        self.name = dto.name
        self.size = dto.size
    }
}
