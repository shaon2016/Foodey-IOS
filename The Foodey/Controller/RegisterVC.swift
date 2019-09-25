//
//  RegisterVC.swift
//  The Foodey
//
//  Created by MacBook Pro  on 18/9/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class RegisterVC: UIViewController {
    private let signupURL = "login/views/signup.php"
    
    //MARK: All Outlets
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var mobileTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        doRegistration()
    }
    
    //MARK: Networking
    func doRegistration() {
        if let name = nameTF.text, let mobile = mobileTF.text , let password = passwordTF.text, !name.isEmpty, !mobile.isEmpty, !password.isEmpty {
            let url = "\(Constant.BASE_URL)\(signupURL)"
            let params = [ "name" : name , "mobile" : mobile, "password" : password]
            
            Alamofire.request(url, method: .post, parameters : params).responseJSON { response in
                
                if response.result.isSuccess {
                    let signupSON = JSON(response.result.value!)
                    
                    self.handleSignupJSON(signUpJSON: signupSON)
                }
                else {
                    print("Failed to login")
                }
            }
        } else {
            print("Insert mobile and password")
        }
    }
    
    func handleSignupJSON(signUpJSON : JSON) {
        print(signUpJSON)
        
        let status = signUpJSON["success"].int
        let message = signUpJSON["message"].string
        
        if status == 1 {
            print("Successfully login")
            // Go to home page // Here homeVC is the storyboard viewcontroller id
            let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "homeVC")
            present(homeVC!, animated: true, completion: nil)
            //            dismiss(animated: false, completion: nil)
        } else {
            print(message!)
        }
    }
    

}
