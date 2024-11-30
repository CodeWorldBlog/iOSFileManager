//
//  DocumentDTO.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 23/06/24.
//

import Foundation

struct FolderDTO: DocumentDTO {
    fileprivate(set) var creationTimestamp: Date
    fileprivate(set) var name: String
    fileprivate(set) var size: Double
    fileprivate(set) var icon: String?
    
    init(name: String, size: Double, creationTimestamp: Date, icon: String? = nil) {
        self.name = name
        self.size = size
        self.creationTimestamp = creationTimestamp
        self.icon = icon
    }
}
