//
//  Dictionary+Data.swift
//  FileManager
//
//  Created by Saurav Nagpal on 11/03/24.
//

import Foundation

struct PlistBuddy {
    static func readPlist(filename: String) -> Any? {
        guard let path = Bundle.main.path(forResource: filename, ofType: "plist") else {
            return nil
        }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            return try PropertyListSerialization.propertyList(from: data, options: [], format: nil) 
        } catch {
            print("Read from filename \(filename) error ")
        }
        return nil
    }
}
