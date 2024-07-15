//
//  StorageUnitEntity+CoreDataProperties.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 12/06/24.
//
//

import Foundation
import CoreData


extension StorageUnitEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StorageUnitEntity> {
        return NSFetchRequest<StorageUnitEntity>(entityName: "StorageUnitEntity")
    }

    @NSManaged public var creationTimestamp: Date?
    @NSManaged public var name: String?
    @NSManaged public var size: Double
    @NSManaged public var folder: FolderEntity?

}

extension StorageUnitEntity : Identifiable {

}
