//
//  SNFirebaseRequest.swift
//  Awakening Stories
//
//  Created by Saurav Nagpal on 23/12/22.
//

import Foundation

enum FirbasePath: RequestPath {
    case collection(path: String)
    case document(path: String)
}

public enum SNFirebaseRequestMethod: RequestMethod {
    case fetch
    case add
}

public class SNFirebaseRequest: SNNetworkRequest {
    public let path: RequestPath
    public let method: SNFirebaseRequestMethod
    public var queryParametersEncodable: NetworkEncodableData?
    public let queryParameters: [String: Any]
    public let responseDecoder: ResponseDecoder
    
    init(path: FirbasePath,
         method: SNFirebaseRequestMethod,
         queryParametersEncodable: NetworkEncodableData? = nil,
         queryParameters: [String: Any] = [:],
         responseDecoder: ResponseDecoder = JSONResponseDecoder()) {
        self.path = path
        self.method = method
        self.queryParametersEncodable = queryParametersEncodable
        self.queryParameters = queryParameters
        self.responseDecoder = responseDecoder
    }
}
