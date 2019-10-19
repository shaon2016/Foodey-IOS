//
//  MyUserDefault.swift
//  The Foodey
//
//  Created by MacBook Pro  on 28/9/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import Foundation
import SwiftyJSON

struct MyUserDefault {
    private let myDefaults = UserDefaults.standard
    private let USER_ID_KEY = "user_id"
    private let USER_NAME_KEY = "user_name"
    private let USER_MOBILE_KEY = "user_mobile"
    
    func saveLoginResponse(data : JSON)  {
        
        let user = User(id: data["id"].intValue, name: data["name"].stringValue , mobile: data["mobile"].stringValue)
        myDefaults.set(user.id, forKey: USER_ID_KEY)
        myDefaults.set(user.name, forKey: USER_NAME_KEY)
        myDefaults.set(user.mobile, forKey: USER_MOBILE_KEY)
        myDefaults.synchronize()
    }
    
    func signout() {
        myDefaults.removeObject(forKey: USER_ID_KEY)
        myDefaults.removeObject(forKey: USER_NAME_KEY)
        myDefaults.removeObject(forKey: USER_MOBILE_KEY)
    }
    
    func isLoggedIn() -> Bool {
        let id = getUserId()
    
        if id > 0 {
            return true
        }
        return false
    }
    
    func getUserId() -> Int {
        return myDefaults.integer(forKey: USER_ID_KEY)
    }
}
