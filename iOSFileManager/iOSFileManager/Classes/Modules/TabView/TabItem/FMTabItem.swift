//
//  MTabItem.swift
//  FileManager
//
//  Created by Saurav Nagpal on 26/04/23.
//

import Foundation

struct FMTabItem: Identifiable, Hashable {
    let id = UUID()
    let tabName: FileManagerTab
    let title: String
    let iconName: String?
    var tag: Int = 0

    
    init(tabName: FileManagerTab, title: String, iconName: String? = nil) {
        self.iconName = tabName.defaultIconName
        self.title = tabName.defaultTitleName
        self.tabName = tabName
    }
    
    init(tabName: FileManagerTab) {
        self.init(tabName: tabName, title: tabName.defaultTitleName)
    }
}
