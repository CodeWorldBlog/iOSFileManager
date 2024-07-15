//
//  FileManager+DirectoryAccess.swift
//  FileManager
//
//  Created by Saurav Nagpal on 10/03/24.
//

import Foundation

enum DefaultDirectory {
    case document
    case cache
}

extension FileManager {
    static func pathForDefaultDirectory(_ directory: DefaultDirectory) -> String? {
        switch directory {
        case .document:
            return (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as [String]).first
        case .cache:
            return (NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true) as [String]).first
        }
    }
    
    static func urlForDefaultDirectory(_ directory: DefaultDirectory) -> URL? {
        switch directory {
        case .document:
            return try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        case .cache:
            return try? FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        }
        
    }

}
