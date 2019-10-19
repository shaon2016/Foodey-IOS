//
//  CheckoutVC.swift
//  The Foodey
//
//  Created by MacBook Pro  on 19/10/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON

class CheckoutVC: UIViewController {
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var vatLabel: UILabel!
    @IBOutlet weak var payableAmountLabel: UILabel!
    
    var carts = [Cart]()
    private var payableAmount : Double  = 0.0 {
        didSet {
            payableAmountLabel.text = String(payableAmount)
        }
    }
    
    private var vat : Double  = 0.0 {
        didSet {
            vatLabel.text = String(vat)
        }
    }
    
    private var discount : Double  = 0.0 {
        didSet {
            discountLabel.text = String(discount)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }
    
    func initCarts(carts : [Cart])  {
        self.carts = carts
    }
    
    func initView() {
        var subTotal = 0.0
        carts.forEach { (cart) in
            subTotal += (cart.food_price * Double(cart.quantity))
        }
        subtotalLabel.text = String(subTotal)
        discount = 60.0
        vat = 0.15
        payableAmount = subTotal + (subTotal * vat) - discount
        
    }
    
    @IBAction func postOrderBtnTapped(_ sender: Any) {
        postOrder()
    }
    
    // MARK: POST Order portion
    
    func postOrder()  {
        let alert = UIAlertController(title: "Post Order", message: "Are you sure to post this order?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (action) in
            self.confirmOrder()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func confirmOrder() {
        let url = "\(Constant.BASE_URL)post_order.php"
        let params = getNecessaryParamsForPostOrder()
        Alamofire.request(url, method: .post, parameters: params).responseJSON {
            response in
            if response.result.isSuccess {
                let jo = JSON(response.result.value!)
                self.handlingPostOrderJSON(jo: jo)
            } else {
                // TODO show simple error dialog
            }
        }
    }
    
    private func handlingPostOrderJSON(jo : JSON) {
        let status = jo["success"].intValue
        if status == 1 {
            // Order posted successfully
            print("Order posted successfully")
        } else {
            print("Credential mismatch")
        }
    }
    
    private func getNecessaryParamsForPostOrder() -> Dictionary<String, String> {
        var cartItemsJsonArray = Array<Dictionary<String, Any>>()
        var foodDictionary = Dictionary<String, Any>()
        carts.forEach { (cart) in
            foodDictionary["id"] = cart.food_id
            foodDictionary["name"] = cart.food_name
            foodDictionary["price"] = cart.food_price
            foodDictionary["quantity"] = cart.quantity
            cartItemsJsonArray.append(foodDictionary)
        }
        
        let cartJA = JSON(cartItemsJsonArray)
        
        return ["user_id" : String(MyUserDefault().getUserId()), "cart_items_in_ja" : cartJA.rawString() ?? "", "total_price" : String(payableAmount) ,
                "discount" : String(discount), "vat" : String(vat)]
    }
    
}
// MARK: TableView portion
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
