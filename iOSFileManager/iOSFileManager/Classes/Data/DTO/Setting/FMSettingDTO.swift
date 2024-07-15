//
//  FMSettingDTO.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 04/07/24.
//

import Foundation

struct SettingDTO {
    fileprivate(set) var settingKey: String
    fileprivate(set) var value: Data
    
    init(settingKey: String, value: Data) {
        self.settingKey = settingKey
        self.value = value
    }
}
