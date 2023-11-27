//
//  Constants.swift
//  IOSecondProject
//
//  Created by Ali Shan on 20/11/2023.
//

import Foundation

struct Constants{
    static let baseUrl:String = "https://joodapi-uat.azurewebsites.net/"
    static let CONTENT_TYPE_KEY = "Content-type"
    static let CONTENT_TYPE_VALUE = "application/json"
    static let AUTHORIZATION = "Authorization"
    static let LOCALE = "Accept-Language"
    static let DEVICE_ID = "deviceid"
    static let PLATFORM = "platform"
    static let IOS = "IOS"
}
struct APIEndpoints{
    static let login:String = "auth/login"
}
