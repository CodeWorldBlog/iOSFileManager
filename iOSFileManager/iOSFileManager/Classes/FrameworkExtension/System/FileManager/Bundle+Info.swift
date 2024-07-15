//
//  Bundle+Info.swift
//  FileManager
//
//  Created by Saurav Nagpal on 10/03/24.
//

import Foundation

extension Bundle {
    var appIdentifer: String? {
        self.bundleIdentifier
    }
    
    func isResourceExist(resource: String) -> Bool {
        let resourceComponents = resource.components(separatedBy: ".")
        if resourceComponents.count == 2, let resourceName = resourceComponents.first, let resourceExt = resourceComponents.last {
            return (self.path(forResource: resourceName, ofType: resourceExt) != nil)
        }
        return false
    }
}
