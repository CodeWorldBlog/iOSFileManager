//
//  FMStorageUnit.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 30/06/24.
//

import Foundation

protocol FMStorageUnit {
    var creationTimestamp: Date { get }
    var name: String { get }
    var size: Double { get }  
}
