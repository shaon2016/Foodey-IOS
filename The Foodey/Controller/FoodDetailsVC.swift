//
//  FoodDetailsVC.swift
//  The Foodey
//
//  Created by MacBook Pro  on 28/9/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit

class FoodDetailsVC: UIViewController {
    @IBOutlet weak var ivFood: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private var f : Food?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = f?.name
        priceLabel.text = f?.price
        descriptionLabel.text = f?.description
        ivFood.sd_setImage(with: URL(string: f?.image ?? ""), placeholderImage: UIImage(named: "beats"))
    }
    
    
    func initFood(food : Food)  {
        f = food

        
    }

}
