//
//  FMFinderCategoryListCellModel.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 28/10/24.
//

import Foundation

struct FMFinderCategoryListCellModel {
    let header: String
    let categories: [FMFinderCategory]
}

struct FMFinderCategory: Identifiable {
    let id: UUID
    let title: String
    let icon: String?
    
    init(category: FMCategory) {
        self.id = UUID()
        self.title = category.name
        self.icon = category.icon
    }
}
