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
    func saveDocument(document: DocumentDTO) -> Future<Bool, Error>
    func fetchAllDocuments() async -> [DocumentDTO]
    func fetchAllFiles() async -> [FileDTO]
    func deleteDocument(document: DocumentDTO)
    
    func fetchAllCatgeories() async -> [CategoryDTO]
}

protocol FMSettingStorage {
    func fetchAllSettings() async -> [SettingDTO]
}




