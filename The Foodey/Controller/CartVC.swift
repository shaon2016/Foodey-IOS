//
//  CartVC.swift
//  The Foodey
//
//  Created by MacBook Pro  on 14/10/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit

class CartVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as? FoodCell {
            
            return cell
        }
        
        return FoodCell()
    }


}
