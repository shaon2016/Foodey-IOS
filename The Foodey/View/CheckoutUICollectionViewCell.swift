//
//  CheckoutUICollectionViewCell.swift
//  The Foodey
//
//  Created by MacBook Pro  on 19/10/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit

class CheckoutUICollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var foodTitleLabel: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var qtyLabel: UILabel!
    
    func updateView(cart : Cart) {
        foodTitleLabel.text = cart.food_name
        foodPriceLabel.text = String(cart.food_price)
        qtyLabel.text = String("Quantity: \(cart.quantity)")
        foodImage.sd_setImage(with: URL(string: cart.food_image ?? ""), placeholderImage: UIImage(named: "beats"))
    }
}
