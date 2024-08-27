//
//  FileManager+DirectoryAccess.swift
//  FileManager
//
//  Created by Saurav Nagpal on 10/03/24.
//

import Foundation


extension FileManager {
    enum Directory {
        case document
        case cache
        case library
        
        var path: String? {
            switch self {
            case .document:
                return (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as [String]).first
            case .cache:
                return (NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true) as [String]).first
            case .library:
                return (NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true) as [String]).first
            }
        }
        
        var url: URL  {
            get throws {
                switch self {
                case .document:
                    return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                case .cache:
                    return try FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                case .library:
                    return try FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                }
            }
        }
    }
}
