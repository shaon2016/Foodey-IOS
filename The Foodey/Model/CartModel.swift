//
//  CartModel.swift
//  The Foodey
//
//  Created by MacBook Pro  on 20/10/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import Foundation
import SwiftyJSON

struct CartModel {
    var id : Int
    var foodName : String
    var foodPrice : Double
    var quantity : Int
    
    
    static func parseCarts(cartsJSON : [JSON]) -> [CartModel] {
        var carts = [CartModel]()
        
        for item in cartsJSON {
            carts.append(parseCart(cartJSON: item))
        }
        
        return carts
    }
    
    static func parseCart(cartJSON : JSON) -> CartModel {
        return CartModel(id: cartJSON["id"].intValue, foodName: cartJSON["name"].stringValue, foodPrice: cartJSON["price"].doubleValue, quantity: cartJSON["quantity"].intValue)
    }
}
