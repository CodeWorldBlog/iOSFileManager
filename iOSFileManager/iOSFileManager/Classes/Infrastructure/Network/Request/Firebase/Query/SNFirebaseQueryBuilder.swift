//
//  SNFirebaseQueryBuilder.swift
//  Mammer
//
//  Created by Saurav Nagpal on 27/05/23.
//

import Foundation

struct SNFirebaseQueryBuilder {
    static func buildQuery(request: SNFirebaseRequest) throws -> SNFirebaseQuery? {
        switch request.method {
        case .fetch:
            return self.fetchQuery(request: request)
        case .add:
            return try self.addQuery(request: request)
        }
    }
}

//MARK: - Fetch
fileprivate extension SNFirebaseQueryBuilder {
    static func fetchQuery(request: SNFirebaseRequest) -> SNFirebaseQuery? {
        guard let firebasePath = request.path as? FirbasePath else {
            return nil
        }
        switch firebasePath {
        case .collection(let url):
            return FirebaseCollectionFetchQuery(collectionID: url, queryParameter: request.queryParameters)
        case .document(let url):
            return FirebaseDocumentFetchQuery(documentPath: url)
        }
    }
}

//MARK: - Add
fileprivate extension SNFirebaseQueryBuilder {
    static func addQuery(request: SNFirebaseRequest) throws -> SNFirebaseQuery? {
        guard let firebasePath = request.path as? FirbasePath else {
            return nil
        }
        let bodyParameters = try request.queryParametersEncodable?.toDictionary() ?? request.queryParameters
        switch firebasePath {
        case .collection(let url):
            return SNFirbaseAddDocumentQuery(collectionPath: url, postData: bodyParameters)
        case .document(let url):
            return FirebaseDocumentFetchQuery(documentPath: url)
        }
    }
}
