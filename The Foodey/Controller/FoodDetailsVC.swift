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
       CartDataService.instance.insert(f: f)
    }
    
    // MARK: Data Model manipulation methods
    
    
}
