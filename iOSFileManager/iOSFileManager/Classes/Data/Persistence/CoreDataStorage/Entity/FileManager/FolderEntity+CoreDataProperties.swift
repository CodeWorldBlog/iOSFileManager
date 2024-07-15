//
//  FolderEntity+CoreDataProperties.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 12/06/24.
//
//

import Foundation
import CoreData


extension FolderEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FolderEntity> {
        return NSFetchRequest<FolderEntity>(entityName: "FolderEntity")
    }

    @NSManaged public var childs: NSOrderedSet?

}

// MARK: Generated accessors for childs
extension FolderEntity {

    @objc(insertObject:inChildsAtIndex:)
    @NSManaged public func insertIntoChilds(_ value: StorageUnitEntity, at idx: Int)

    @objc(removeObjectFromChildsAtIndex:)
    @NSManaged public func removeFromChilds(at idx: Int)

    @objc(insertChilds:atIndexes:)
    @NSManaged public func insertIntoChilds(_ values: [StorageUnitEntity], at indexes: NSIndexSet)

    @objc(removeChildsAtIndexes:)
    @NSManaged public func removeFromChilds(at indexes: NSIndexSet)

    @objc(replaceObjectInChildsAtIndex:withObject:)
    @NSManaged public func replaceChilds(at idx: Int, with value: StorageUnitEntity)

    @objc(replaceChildsAtIndexes:withChilds:)
    @NSManaged public func replaceChilds(at indexes: NSIndexSet, with values: [StorageUnitEntity])

    @objc(addChildsObject:)
    @NSManaged public func addToChilds(_ value: StorageUnitEntity)

    @objc(removeChildsObject:)
    @NSManaged public func removeFromChilds(_ value: StorageUnitEntity)

    @objc(addChilds:)
    @NSManaged public func addToChilds(_ values: NSOrderedSet)

    @objc(removeChilds:)
    @NSManaged public func removeFromChilds(_ values: NSOrderedSet)

}
