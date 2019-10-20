//
//  Orders.swift
//  The Foodey
//
//  Created by MacBook Pro  on 20/10/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Order {
    var id : Int
    var userId : Int
    var items : Array<CartModel>
    var payablePrice : Double
    var discount : Double
    var vat : Double
    var createdAt : String
    
    
    static func parseOrders(orderJSON : [JSON]) -> [Order]  {
        var orders = [Order]()
        
        for item in orderJSON {
            orders.append(parseOrder(orderJSON: item))
        }
        
        return orders
    }
    
    static func parseOrder(orderJSON orderJS : JSON) -> Order {
        
        return Order(id: orderJS["id"].intValue, userId: orderJS["user_id"].intValue, items: CartModel.parseCarts(cartsJSON: JSON.init(parseJSON: orderJS["items"].stringValue).arrayValue), payablePrice: orderJS["payable_price"].doubleValue, discount: orderJS["discount"].doubleValue, vat: orderJS["vat"].doubleValue, createdAt: orderJS["created_at"].stringValue)
    }
}
