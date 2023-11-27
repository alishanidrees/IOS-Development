//
//  LoginViewController.swift
//  IOSecondProject
//
//  Created by Ali Shan on 06/11/2023.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var txtFieldEmail: UITextField!
    
    @IBOutlet weak var txtFieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    @IBAction func btnContinue(_ sender: UIButton) {
        let email = txtFieldEmail.text ?? ""
        let password = txtFieldPassword.text ?? ""
        guard !email.isEmpty && !password.isEmpty else { return }
        
        let paramters = LoginRequest.init(email: email, password: password)
        //(result: Result<APIBaseResponse, Error>) in
        AuthIntractor.shared.login(loginRequest: paramters, completion: { (response,error) in
            if response?.status ?? false {
                let user = response?.data
                AppDefaults.token = response?.data?.accessToken
                self.navigateToOnBoarding()
               // print("data respnse received \(AppDefaults.token ?? "")")
            }
        })
        
//        AuthIntractor.shared.request(target:.Login(parameters: paramters)) {(response:APIBaseResponse<User>?, error:String?) in
//            if response?.status ?? false {
//                let user = response?.data
//                
//                print("data respnse received \(user?.refreshToken ?? "")")
//            }
//        }
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    private func navigateToOnBoarding(){
        guard let onboarding = (self.storyboard?.instantiateViewController(identifier: "OnBoaridngViewController") as? OnBoaridngViewController) else {
            return
        }
        self.navigationController?.pushViewController(onboarding, animated: true)
    }
    
}
