//
//  SettingEntity+CoreDataProperties.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 04/07/24.
//
//

import Foundation
import CoreData


extension SettingEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SettingEntity> {
        return NSFetchRequest<SettingEntity>(entityName: "SettingEntity")
    }

    @NSManaged public var key: String?
    @NSManaged public var value: Data?

}

extension SettingEntity : Identifiable {

}
