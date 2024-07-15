//
//  FileEntity+CoreDataProperties.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 12/06/24.
//
//

import Foundation
import CoreData


extension FileEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FileEntity> {
        return NSFetchRequest<FileEntity>(entityName: "FileEntity")
    }


}
