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
    
    @IBOutlet weak var orderedFoodCountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var vatLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        foodCollectionView.delegate = self
//        foodCollectionView.dataSource = self
//        foodCollectionView.register(UINib(nibName: "OrderedFoodUICollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "orderedFoodCell")
   
    }

    func updateView(order : Order) {
        totalLabel.text = "Total: \(order.payablePrice) BDT"
        discountLabel.text = "Discount: \(order.discount) BDT"
        vatLabel.text = "Vat: \(order.vat) BDT"
        orderedFoodCountLabel.text = "You ordered \(order.items.count) foods"
    }
    
}

extension OrdersTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "orderedFoodCell", for: indexPath) as? OrderedFoodUICollectionViewCell {
            
            return cell
        } else {
            return OrderedFoodUICollectionViewCell()
        }
    }
    
    
}
