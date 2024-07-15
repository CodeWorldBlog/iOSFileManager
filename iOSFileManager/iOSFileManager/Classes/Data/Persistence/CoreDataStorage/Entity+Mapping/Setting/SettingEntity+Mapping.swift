//
//  SettingEntity+Mapping.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 04/07/24.
//

import Foundation

extension SettingEntity: Entity {
    typealias EntityDTO = SettingDTO
    
    func toDTO() -> SettingDTO? {
        guard let key = self.key, let value = self.value else {
            return nil
        }
        return SettingDTO(settingKey: key, value: value)
    }
    
    func fromDTO(entityDTO: SettingDTO) -> Self {
        self.key = entityDTO.settingKey
        self.value = entityDTO.value
        return self
    }
}

extension Data {
    static func dataFromValue(_ value: Any) -> Data? {
        if let stringValue = value as? String {
            return Data(stringValue.utf8)
        } else if var intValue = value as? Int {
            return Data(bytes: &intValue, count: MemoryLayout.size(ofValue: intValue))
        } else if var doubleValue = value as? Double {
            return Data(bytes: &doubleValue, count: MemoryLayout.size(ofValue: doubleValue))
        } else if var boolValue = value as? Bool {
            return Data(bytes: &boolValue, count: MemoryLayout.size(ofValue: boolValue))
        }
        return nil
    }
}

