//
//  FMDocumentCategory.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 16/07/24.
//

import Foundation

enum FMDefaultCategory: CaseIterable {
    case identityproof
    case document
    case music
    
    var name: String {
        switch self {
        case .identityproof: return "Identity Proof"
        case .document: return  "Document"
        case .music: return "Music"
        }
    }
    
    var icon: String {
        switch self {
        case .identityproof:
            return "identitiy"
        case .document:
            return "doc"
        case .music:
            return "music"
        }
    }
}
