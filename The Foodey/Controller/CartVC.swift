//
//  CartVC.swift
//  The Foodey
//
//  Created by MacBook Pro  on 14/10/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit

class CartVC: UITableViewController {

    private let carts = PersistanceManager.pm.fetch(objectType: Cart.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "cartTableViewCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return carts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cartTableViewCell", for: indexPath) as? CartTableViewCell {
            let cart = carts[indexPath.row]
            cell.updateView(cart: cart )
            return cell
        }
        
        return CartTableViewCell()
    }


}
