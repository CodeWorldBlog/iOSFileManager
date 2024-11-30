//
//  CategoryEntity+CoreDataProperties.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 28/10/24.
//
//

import Foundation
import CoreData


extension CategoryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryEntity> {
        return NSFetchRequest<CategoryEntity>(entityName: "CategoryEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var icon: String?

}

extension CategoryEntity : Identifiable {

}
