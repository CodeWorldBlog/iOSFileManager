//
//  SNFirbaseAddQuery.swift
//  Mammer
//
//  Created by Saurav Nagpal on 27/05/23.
//

import Foundation
import Firebase

struct SNFirbaseAddDocumentQuery: SNFirebaseQuery {
    fileprivate(set) var collectionPath: String
    fileprivate(set) var postData: [String: Any]
    
    init(collectionPath: String, postData: [String: Any]) {
        self.collectionPath = collectionPath
        self.postData = postData
    }
    
    func executeQuery(completion: @escaping QueryCompletion) {
        var documentRef: DocumentReference? = nil
        documentRef = Firestore.firestore().collection(self.collectionPath).addDocument(data: self.postData) { error in
            if let error {
                completion(nil, error)
            } else {
                let addedDocument = documentRef?.documentID
                let responseDictionary = ["documentID": addedDocument ?? ""]
                if let jsonData = try? JSONSerialization.data(withJSONObject: responseDictionary){
                    completion(jsonData, nil)
                } else {
                    completion(nil, error)
                }
                print("Document added with ID: \(String(describing: addedDocument))")
            }
        }
    }
}
