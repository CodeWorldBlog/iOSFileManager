//
//  FMDefaultFolder.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 24/10/24.
//

import Foundation

enum FMDefaultFolder: CaseIterable {
    case document
    case music
    case identityproof
    
    var name: String {
        switch self {
        case .identityproof: return "Identity Proof"
        case .document: return "My Document"
        case .music: return "Music"
        }
    }
    
    var icon: String {
        switch self {
        case .document:
            return "defaultFolder"
        case .music:
            return "musicFolder"
        case .identityproof:
            return "musicFolder"
        }
    }
}
