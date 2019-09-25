//
//  ViewController.swift
//  The Foodey
//
//  Created by MacBook Pro  on 18/9/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit

import SwiftyJSON
import Alamofire

class LoginVC: UIViewController {
    private let loginURL = "login/views/login.php"

    // MARK: All view outlet 
    @IBOutlet weak var mobileTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func loginButtonClicked(_ sender: Any) {
        doLogin()
    }
    
    
    //MARK: Networking
    func doLogin() {
        if let mobile = mobileTF.text , let password = passwordTF.text, !mobile.isEmpty, !password.isEmpty {
            let url = "\(Constant.BASE_URL)\(loginURL)"
            let params = ["mobile" : mobile, "password" : password]
            
            Alamofire.request(url, method: .post, parameters : params).responseJSON { response in
                
                if response.result.isSuccess {
                    let loginJSON = JSON(response.result.value!)
                
                    self.handleLoginJSON(loginJSON: loginJSON)
                }
                else {
                    print("Failed to login")
                }
            }
        } else {
            print("Insert mobile and password")
        }
    }

    func handleLoginJSON(loginJSON : JSON) {
        print(loginJSON)
        
        if let status = loginJSON["success"].int {
            
            if status == 1 {
                print("Successfully login")
                // Go to home page // Here homeVC is the storyboard viewcontroller id
                let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "homeVC")
                present(homeVC!, animated: true, completion: nil)
                
                //            dismiss(animated: false, completion: nil)
            } else {
                print("Credential mismatch")
            }
        }
        
        
        
    }
    

}

