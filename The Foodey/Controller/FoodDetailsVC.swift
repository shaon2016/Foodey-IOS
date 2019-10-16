//
//  FoodDetailsVC.swift
//  The Foodey
//
//  Created by MacBook Pro  on 28/9/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit
import CoreData

class FoodDetailsVC: UIViewController {
    // MARK: IBOutlet portions
    @IBOutlet weak var ivFood: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: Instances
    private var f : Food?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = f?.name
        priceLabel.text = String(f?.price ?? 0.0)
        descriptionLabel.text = f?.description
        ivFood.sd_setImage(with: URL(string: f?.image ?? ""), placeholderImage: UIImage(named: "beats"))
    }
    
    
    func initFood(food : Food)  {
        f = food
    }
    
    @IBAction func addToCartBtnTapped(_ sender: Any) {
       
        insert()
    }
    
   private func insert()  {
        if let food = f  {
            // Check food already exists or not
            if let cart = getCart(foodId: food.id) {
                cart.quantity += 1
            } else {
                let cart = Cart(context: PersistanceManager.pm.context)
                cart.food_id = Int64(food.id)
                cart.food_name = food.name
                cart.food_price = food.price
                cart.quantity = 1
            }
            
            PersistanceManager.pm.saveContext()
        }
    }
    
    // MARK: Data Model manipulation methods
    func getCart(foodId id : Int) -> Cart? {
        let request : NSFetchRequest<Cart> = Cart.fetchRequest()
        
        let predicate = NSPredicate(format: "food_id == %i", id)
        
        request.predicate = predicate
        
        do {
            return try PersistanceManager.pm.context.fetch(request).first
        } catch{
            print("Error in Fetching Item data: \(error)")
            return nil
        }
    }
    
}
