//
//  CheckoutVC.swift
//  The Foodey
//
//  Created by MacBook Pro  on 19/10/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit

class CheckoutVC: UIViewController {
    
    var carts = [Cart]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    func initCarts(carts : [Cart])  {
        self.carts = carts
        print(carts.count)
    }
 

}

extension CheckoutVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "checkoutCollectionViewCell", for: indexPath) as? CheckoutUICollectionViewCell {
            let cart = carts[indexPath.row]
            cell.updateView(cart: cart)
            
            return cell
        }
        
        return CheckoutUICollectionViewCell()
    }
    
    
}
