//
//  FMFile.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 30/06/24.
//

import Foundation

class FMFile: FMDocument {
    let identfier: String = UUID().uuidString
    let creationTimestamp: Date
    fileprivate(set) var name: String
    fileprivate(set) var size: Double
    fileprivate(set) var icon: String?
    
    init(dto: FileDTO) {
        self.creationTimestamp = dto.creationTimestamp
        self.name = dto.name
        self.size = dto.size
        self.icon = dto.icon
    }
}
