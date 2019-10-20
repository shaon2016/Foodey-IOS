//
//  OrdersTableViewCell.swift
//  The Foodey
//
//  Created by MacBook Pro  on 20/10/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {

    @IBOutlet weak var orderTokenLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    func updateView(order : Order) {
        
    }
    
}
