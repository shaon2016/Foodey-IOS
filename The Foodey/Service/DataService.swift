//
//  DataService.swift
//  The Foodey
//
//  Created by MacBook Pro  on 26/9/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataService {
    static let instance = DataService()
    var foodTableViewReloadDelegate : updateFoodTableViewDelegate?
    
    private var foods = [Food]()
   
    
    func getFoods() -> [Food] {
       
        return foods
    }
    
    func loadFoods() {
        let url = "\(Constant.BASE_URL)data.php"
        Alamofire.request(url, method: .get).responseJSON { response in
            if (response.result.isSuccess) {
                let foodJson = JSON(response.result.value!)
                
                if let success = foodJson["success"].int {
                    print(foodJson)
                    if success == 1 {
                        if let data = foodJson["data"].array {
                            for i in data.indices {
                                let id = data[i]["id"].int
                                let name = data[i]["name"].string
                                let image = data[i]["image"].string
                                let price = data[i]["price"].string
                                let desc = data[i]["description"].string
                                
                                let f = Food(id: id ?? 0, name: name ?? "", price: price ?? "", image: image ?? "", description: desc ?? "")
                                self.foods.append(f)
                                print(f)
                                
                            }
                            self.foodTableViewReloadDelegate?.foodFromServerLoadDone()
                        }
                    
                    }
                    else {
                        
                    }
                }
            } else {
                
            }
        }
    }
}

protocol updateFoodTableViewDelegate {
    func foodFromServerLoadDone()
}
