//
//  AppDefaults.swift
//  IOSecondProject
//
//  Created by Ali Shan on 23/11/2023.
//

import Foundation

class AppDefaults : UserDefaults{
 
    static let shared = AppDefaults()
    
    override class var standard: UserDefaults {
        return UserDefaults.standard
    }
    
    static var token:String?{
        get {AppDefaults.standard.string(forKey: #function)}
        set {AppDefaults.standard.set(newValue, forKey: #function)}
    }

}
