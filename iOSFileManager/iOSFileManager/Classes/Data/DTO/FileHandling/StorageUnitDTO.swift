//
//  StorageUnitDTO.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 23/06/24.
//

import Foundation

protocol DocumentDTO {
    var creationTimestamp: Date { get }
    var name: String { get }
    var size: Double { get }    
}
