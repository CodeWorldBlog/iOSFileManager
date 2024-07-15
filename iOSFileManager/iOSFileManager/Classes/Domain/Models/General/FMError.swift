//
//  SNError.swift
//
//  Created by Saurav Nagpal on 07/11/22.
//

import Foundation

enum FMError: Error {
    case firebaseInvalidParameter
    case firebaseInvalidResponse
    case authError(message: String)
    case validationFailure(message: String)
    case networkError(error: Error?)
    case documentNotFound
    
    public var message: String {
        switch self {
        case .networkError(let error):
            return error?.localizedDescription ?? ""
        case .firebaseInvalidResponse:
            return "Response is Invalid."
        case .authError(let message):
            return message
        case .firebaseInvalidParameter:
            return "Request is Invalid."
        case .validationFailure(message: let message):
            return message
        case .documentNotFound:
            return "Document not found."
        }
    }
}
