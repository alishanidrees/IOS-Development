//
//  HomeIntractor.swift
//  IOSecondProject
//
//  Created by Ali Shan on 23/11/2023.
//

import Foundation

class HomeIntractor{
    
    static let shared = HomeIntractor()
    
    func home(completion:@escaping NetworkManagerCompletion<HomeResponse>){
        let target:HomeAPI = .Home
        NetworkManager().request(target: target, completion: completion)
    }
}
