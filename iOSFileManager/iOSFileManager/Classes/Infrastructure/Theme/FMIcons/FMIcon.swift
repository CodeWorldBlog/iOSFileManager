//
//  FMIcon.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 24/10/24.
//

import Foundation

//https://www.flaticon.com/packs/files-and-folders-128
enum FMIcon {
    case defaultFolderIcon
    case music
    case bin
    case picture
    
    var name: String {
        switch self {
        case .defaultFolderIcon:
            return "defaultFolder"
        case .music:
            return "musicFolder"
        case .bin:
            return "binFolder"
        case .picture:
            return "pictureFolder"
        }
    }
}
