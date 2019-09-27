//
//  FoodCell.swift
//  The Foodey
//
//  Created by MacBook Pro  on 23/9/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit

class FoodCell: UITableViewCell {
    
    @IBOutlet weak var ivFood: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    
    func updateViews(f : Food) {
        nameLabel.text = f.name
        priceLabel.text = f.price
    }
}
