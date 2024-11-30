//
//  FileEntity+CoreDataProperties.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 02/11/24.
//
//

import Foundation
import CoreData


extension FileEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FileEntity> {
        return NSFetchRequest<FileEntity>(entityName: "FileEntity")
    }

    @NSManaged public var lastViewedAt: Date?
    @NSManaged public var modifiedAt: Date?

}
