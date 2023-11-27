//
//  PreLoginViewController.swift
//  IOSecondProject
//
//  Created by Ali Shan on 04/11/2023.
//

import Foundation
import UIKit

class PreLoginViewController: UIViewController {
    
    let testName = "Hello Ali"
    let possibleNumber = "123"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func btnSignupAction(_ sender: UIButton) {
        let loginViewController = (self.storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController)
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    func debugOnAssert(){
        let age = 3
        assert(age >= 0, "A person's age can't be less than zero.")
    }
    func debugOnPrecondition(){
        let index = -5
        precondition(index > 0, "Index must be greater than zero.")
    }
    func forLoop(){
        let names = ["ali","shan","sami","john"]
        let count  = names.count
        for i in 0..<count{
            print(names[i])
        }
        for name in names[..<2]{
            print(name)
        }
    }
    
}
