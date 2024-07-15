//
//  UserDefaultPropertyWrapper.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 01/07/24.
//

import Foundation

@propertyWrapper
struct UserDefaultPersist<Value> {
    private var defaultKey: String
    var wrappedValue: Value? {
        get {
            UserDefaults.standard.value(forKey: defaultKey) as? Value
        } set {
            UserDefaults.standard.setValue(newValue, forKey: defaultKey)
        }
    }
    
    init(defaultKey: String, defaultValue: Value) {
        self.defaultKey = defaultKey
        self.wrappedValue = defaultValue
    }
}
