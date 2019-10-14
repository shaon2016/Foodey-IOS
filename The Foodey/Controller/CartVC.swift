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

        tableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "cartTableViewCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cartTableViewCell", for: indexPath) as? CartTableViewCell {
            
            return cell
        }
        
        return CartTableViewCell()
    }


}
