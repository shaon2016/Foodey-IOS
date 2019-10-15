//
//  CartVC.swift
//  The Foodey
//
//  Created by MacBook Pro  on 14/10/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit

class CartVC: UITableViewController {

    private let carts = CartDataService.instance.getCarts()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "cartTableViewCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return carts?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cartTableViewCell", for: indexPath) as? CartTableViewCell {
            let cart = carts?[indexPath.row]
            cell.updateView(cart: cart ?? Cart())
            return cell
        }
        
        return CartTableViewCell()
    }


}
