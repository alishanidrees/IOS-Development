//
//  APIManager.swift
//  IOSecondProject
//
//  Created by Ali Shan on 20/11/2023.
//

import Foundation
import Moya

typealias Parameters = [String: Any]

enum API {
    case Login(parameters: Parameters)
}

extension API:TargetType{
    var baseURL: URL {
        guard let url = URL(string: Constants.baseUrl) else{
            fatalError()
        }
        return url
    }
    
    var path: String {
        switch self {
        case .Login:
            return APIEndpoints.login
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var task: Moya.Task {
        switch self {
        case .Login(let parameters):
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ApiHeaders.shared.getHeaders()
    }
    
}
