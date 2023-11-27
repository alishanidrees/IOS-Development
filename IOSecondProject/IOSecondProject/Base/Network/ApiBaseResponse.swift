//
//  ApiBaseResponse.swift
//  IOSecondProject
//
//  Created by Ali Shan on 21/11/2023.
//

import Foundation
struct APIBaseResponse<ResponseData: Codable>: Codable {
    let status: Bool
    let statusCode: Int
    let message: String
    let data: ResponseData?


    
//    func getStatus() -> APIStatusCode {
//        return APIStatusCode.init(rawValue: statusCode) ?? .unknown
//    }
}
