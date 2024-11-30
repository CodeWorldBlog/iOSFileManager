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
    @NSManaged public func insertIntoChilds(_ value: DocumentEntity, at idx: Int)

    @objc(removeObjectFromChildsAtIndex:)
    @NSManaged public func removeFromChilds(at idx: Int)

    @objc(insertChilds:atIndexes:)
    @NSManaged public func insertIntoChilds(_ values: [DocumentEntity], at indexes: NSIndexSet)

    @objc(removeChildsAtIndexes:)
    @NSManaged public func removeFromChilds(at indexes: NSIndexSet)

    @objc(replaceObjectInChildsAtIndex:withObject:)
    @NSManaged public func replaceChilds(at idx: Int, with value: DocumentEntity)

    @objc(replaceChildsAtIndexes:withChilds:)
    @NSManaged public func replaceChilds(at indexes: NSIndexSet, with values: [DocumentEntity])

    @objc(addChildsObject:)
    @NSManaged public func addToChilds(_ value: DocumentEntity)

    @objc(removeChildsObject:)
    @NSManaged public func removeFromChilds(_ value: DocumentEntity)

    @objc(addChilds:)
    @NSManaged public func addToChilds(_ values: NSOrderedSet)

    @objc(removeChilds:)
    @NSManaged public func removeFromChilds(_ values: NSOrderedSet)

}
