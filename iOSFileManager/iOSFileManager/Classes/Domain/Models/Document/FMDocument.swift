//
//  FMStorageUnit.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 30/06/24.
//

import Foundation

protocol FMDocument {
    var identfier: String { get }
    var creationTimestamp: Date { get }
    var name: String { get }
    var size: Double { get }
    var icon: String? { get }
}
