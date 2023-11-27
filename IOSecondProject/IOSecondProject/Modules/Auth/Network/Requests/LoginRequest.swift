//
//  LoginRequest.swift
//  IOSecondProject
//
//  Created by Ali Shan on 20/11/2023.
//

import Foundation

struct LoginRequest: Codable {
    let email: String
    let password: String
    
    func getDictionary() -> Parameters {
        return [
            "email": email,
            "password": password
        ]
    }
}
