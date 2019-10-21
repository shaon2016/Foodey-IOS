//
//  OrderedFoodUICollectionViewCell.swift
//  The Foodey
//
//  Created by MacBook Pro  on 21/10/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit

class OrderedFoodUICollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
        priceLabel.text = "Price: 200"
    }

}
