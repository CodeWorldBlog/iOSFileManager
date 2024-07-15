//
//  SNFirebaseQuery.swift
//  Awakening Stories
//
//  Created by Saurav Nagpal on 25/12/22.
//

import Foundation
import Firebase

typealias QueryCompletion = (Data?, Error?) -> Void
protocol SNFirebaseQuery: NetworkQueryParameter {
    func executeQuery(completion: @escaping QueryCompletion)
}
