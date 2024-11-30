//
//  FMFinderFolderCellModel.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 23/10/24.
//

import Foundation

struct FMFinderFolderListCellModel {
    let header: String
    let folders: [FMFinderDocument]
    let documentTapped: (FMFinderDocument) -> Void
    
    func documentTapped(_ document: FMFinderDocument) {
        self.documentTapped(document)
    }
}

struct FMFinderDocument: Identifiable {
    let id: UUID
    let title: String
    let creationDate: String
    let size: String
    let icon: String?
    
    init(document: FMDocument) {
        self.id = UUID()
        self.title = document.name
        self.creationDate = document.creationTimestamp.description
        self.size = document.size.description
        self.icon = document.icon
    }
}
