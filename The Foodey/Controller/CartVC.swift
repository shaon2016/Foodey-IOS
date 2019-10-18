//
//  CartVC.swift
//  The Foodey
//
//  Created by MacBook Pro  on 14/10/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit

class CartVC: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    private let carts = PersistanceManager.pm.fetch(objectType: Cart.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cartTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "cartTableViewCell")
        
        
    }
    
    @IBAction func checkoutBtnTapped(_ sender: Any) {
        
    }
}

extension CartVC :  UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cartTableViewCell", for: indexPath) as? CartTableViewCell {
            let cart = carts[indexPath.row]
            cell.updateView(cart: cart)
            
            // the code that will be executed when user tap on the button
            // notice the capture block has [unowned self]
            // the 'self' is the viewcontroller
            cell.quantityChangeButtonAction = { [unowned self] isToIncrement in
                if isToIncrement == true {
                    cart.quantity += 1
                }else {
                    cart.quantity -= 1
                }
                cell.updateView(cart: cart)
                PersistanceManager.pm.saveContext()
            }
            
            return cell
        }
        
        return CartTableViewCell()
    }
    
}

