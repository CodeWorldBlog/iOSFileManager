//
//  ASStorage.swift
//  Awakening Stories
//
//  Created by Saurav Nagpal on 13/01/23.
//

import Foundation
import Combine

typealias FMStorage = (FMDocumentStorage & FMSettingStorage)

protocol FMDocumentStorage {
    func saveDocument(document: StorageUnitDTO) -> Future<Bool, Error>
    func fetchAllDocuments() async -> [StorageUnitDTO]
    func deleteDocument(document: StorageUnitDTO)
}

protocol FMSettingStorage {
    func fetchAllSettings() async -> [SettingDTO]
}




