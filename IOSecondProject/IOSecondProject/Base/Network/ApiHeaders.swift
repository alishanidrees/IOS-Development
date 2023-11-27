//
//  ApiHeaders.swift
//  IOSecondProject
//
//  Created by Ali Shan on 23/11/2023.
//

import Foundation
typealias Headers = [String: String]

class ApiHeaders {
    
    static let shared = ApiHeaders()
    
    func getHeadersWithToken() -> Headers{
        return [Constants.CONTENT_TYPE_KEY: Constants.CONTENT_TYPE_VALUE,
                Constants.LOCALE:"en",
                Constants.DEVICE_ID: "abc12345",
                Constants.PLATFORM: "IOS",
                Constants.AUTHORIZATION: "Bearer \(AppDefaults.token ?? "")"
        ]
    }
    
    func getHeaders() -> Headers{
        return [Constants.CONTENT_TYPE_KEY: Constants.CONTENT_TYPE_VALUE,
                Constants.LOCALE:"en",
                Constants.DEVICE_ID: "abc12345",
                Constants.PLATFORM: "IOS"
        ]
    }
    
}
