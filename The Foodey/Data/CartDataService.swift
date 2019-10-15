//
//  File.swift
//  The Foodey
//
//  Created by MacBook Pro  on 15/10/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CartDataService {
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    static let instance = CartDataService()
    var cartTableViewReloadDelegate : UpdateCartTableViewDelegate?
    
    
    func getCarts() -> [Cart]? {
        let request : NSFetchRequest<Cart> = Cart.fetchRequest()
        do {
            return try context.fetch(request)
        } catch{
            print("Error in Fetching Item data: \(error)")
            return nil
        }
    }
    
    func saveItem()  {
        do {
            try context.save()
        } catch {
            print("Error in Item save \(error)")
        }
    }
    
    func getCart(foodId id : Int) -> Cart? {
        let request : NSFetchRequest<Cart> = Cart.fetchRequest()
        let predicate = NSPredicate (format: "food_id == %@", id)
        
        request.predicate = predicate
        
        do {
            return try context.fetch(request).first
        } catch{
            print("Error in Fetching Item data: \(error)")
            return nil
        }
    }
}

protocol UpdateCartTableViewDelegate {
    func foodFromDb()
}
