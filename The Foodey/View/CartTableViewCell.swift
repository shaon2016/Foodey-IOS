//
//  CartTableViewCell.swift
//  The Foodey
//
//  Created by MacBook Pro  on 15/10/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var quantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    
    @IBAction func quantityIncrementTapped(_ sender: Any) {
    }
    
    @IBAction func quantityDecrementTapped(_ sender: Any) {
    }
}
