//
//  AuthIntractor.swift
//  IOSecondProject
//
//  Created by Ali Shan on 22/11/2023.
//

import Foundation

class AuthIntractor {
    private init(){
        
    }
    static let shared = AuthIntractor()
    
    func login(loginRequest:LoginRequest,completion:@escaping NetworkManagerCompletion<User>){
        let target:API = .Login(parameters: loginRequest.getDictionary())
        NetworkManager().request(target: target, completion: completion)
    }
    
}


