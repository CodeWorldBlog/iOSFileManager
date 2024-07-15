//
//  String+Path.swift
//  FileManager
//
//  Created by Saurav Nagpal on 11/03/24.
//

import Foundation

extension String {
    func removeExtensionFromName() -> String? {
        let resourceComponents = self.components(separatedBy: ".")
        if resourceComponents.count == 2, let name = resourceComponents.first {
            return name
        }
        return nil
    }
}
