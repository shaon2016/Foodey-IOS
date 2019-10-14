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
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
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
        let cart = Cart(context: context)
        
        if let food = f  {
            // Check food already exists or not
            if let cart = getCart(foodId: food.id) {
                cart.quantity += 1
            } else {
                cart.food_id = Int64(food.id)
                cart.food_name = food.name
                cart.food_price = food.price
                cart.quantity = 1
            }
          // Saving or updating database
            saveItem()
        }
    }
    
    // MARK: Data Model manipulation methods
    
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
