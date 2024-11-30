//
//  DocumentEntity+CoreDataProperties.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 02/11/24.
//
//

import Foundation
import CoreData


extension DocumentEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DocumentEntity> {
        return NSFetchRequest<DocumentEntity>(entityName: "DocumentEntity")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var name: String?
    @NSManaged public var size: Double
    @NSManaged public var folder: FolderEntity?

}

extension DocumentEntity : Identifiable {

}
