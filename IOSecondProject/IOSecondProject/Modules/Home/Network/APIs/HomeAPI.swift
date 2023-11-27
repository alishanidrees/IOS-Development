//
//  API.swift
//  IOSecondProject
//
//  Created by Ali Shan on 22/11/2023.
//

import Foundation
import Moya

enum HomeAPI{
    case Home
}

extension HomeAPI:TargetType{
    var baseURL: URL {
        return URL.init(string: Constants.baseUrl)!
    }
    
    var path: String {
        switch self{
        case .Home:
            return "home"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        switch self{
        case .Home:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .Home:
            return ApiHeaders.shared.getHeadersWithToken()
        }
    }
    
    
}
