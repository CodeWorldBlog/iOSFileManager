//
//  Dictionary+Data.swift
//  FileManager
//
//  Created by Saurav Nagpal on 06/03/24.
//

import Foundation

extension Data {
    static func dictionaryDataFromBundlePlist(filename: String) -> Data? {
        do {
            if let dict = PlistBuddy.readPlist(filename: filename) as? [String: Any] {
                return try JSONSerialization.data(withJSONObject: dict , options: .prettyPrinted)
            }
        } catch {
            print("Read from filename \(filename) error ")
        }
        return nil
    }
    
    func writeDataToUrl(_ url: URL) -> Bool {
        do {
            try self.write(to: url)
            return true
        } catch {
            
        }
        return false
    }
}
