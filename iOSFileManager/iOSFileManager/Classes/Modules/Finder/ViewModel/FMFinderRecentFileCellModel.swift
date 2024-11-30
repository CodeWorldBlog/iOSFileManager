//
//  FMFinderRecentFileCellModel.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 30/10/24.
//

import Foundation

struct FMFinderRecentFileCellModel {
    let id: UUID
    var title: String
    var creationDate: String?
    let size: String
    var icon: String?
    
    init(document: FMFile) {
        self.id = UUID()
        self.title = document.name
        self.creationDate = document.creationTimestamp.description
        self.size = document.size.description
        self.icon = document.icon
    }
}
