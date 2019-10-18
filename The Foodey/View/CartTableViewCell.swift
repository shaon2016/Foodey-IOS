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
    
    @IBOutlet weak var quantityIncrementBtn: UIButton!
    @IBOutlet weak var quantityDecrementBtn: UIButton!
    // the delegate, remember to set to weak to prevent cycles
   // weak var delegate : CartTableViewCellDelegate?
    
    // the closure, () -> () means take no input and return void (nothing)
    // it is wrapped in another parentheses outside in order to make the closure optional
    var quantityChangeButtonAction : ((_ isToIncrement : Bool) -> ())?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        quantityIncrementBtn.addTarget(self, action: #selector(quantityIncrementTapped(_:)), for: .touchUpInside)
        quantityDecrementBtn.addTarget(self, action: #selector(quantityDecrementTapped(_:)), for: .touchUpInside)
    }
    
    func updateView(cart : Cart) {
        nameLabel.text = cart.food_name
        priceLabel.text = String(cart.food_price)
        quantityLabel.text = String(cart.quantity)
        foodImage.sd_setImage(with: URL(string: cart.food_image ?? ""), placeholderImage: UIImage(named: "beats"))
    }

    
    @IBAction func quantityIncrementTapped(_ sender: UIButton) {
        quantityChangeButtonAction?(true)

    }
    
    @IBAction func quantityDecrementTapped(_ sender: UIButton) {
        quantityChangeButtonAction?(false)
    }
}

//// Only class object can conform to this protocol (struct/enum can't)
//protocol CartTableViewCellDelegate : AnyObject {
//    // increment = true, decrement = false
//    func cartTableViewCell(_ cartTVCell : CartTableViewCell, tappedFor isToIncrement : Bool)
//}
