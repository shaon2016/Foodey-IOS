//
//  CartTableViewCell.swift
//  The Foodey
//
//  Created by MacBook Pro  on 15/10/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit
import SDWebImage

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var quantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func updateView(cart : Cart) {
        nameLabel.text = cart.food_name
        priceLabel.text = String(cart.food_price)
        quantityLabel.text = String(cart.quantity)
        foodImage.sd_setImage(with: URL(string: cart.food_image ?? ""), placeholderImage: UIImage(named: "beats"))
    }

    
    @IBAction func quantityIncrementTapped(_ sender: Any) {
    }
    
    @IBAction func quantityDecrementTapped(_ sender: Any) {
    }
}
