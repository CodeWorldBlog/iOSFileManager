//
//  FMCategory.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 28/10/24.
//

import Foundation

struct FMCategory {
    fileprivate(set) var name: String
    fileprivate(set) var icon: String?
    
    init(dto: CategoryDTO) {
        self.name = dto.name
        self.icon = dto.icon
    }
}
