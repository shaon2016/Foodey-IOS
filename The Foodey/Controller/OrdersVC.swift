//
//  OrdersVC.swift
//  The Foodey
//
//  Created by MacBook Pro  on 20/10/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit
import SwiftyJSON
import SVProgressHUD
import Alamofire

class OrdersVC: UITableViewController {

    private var orders = [Order]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "OrdersTableViewCell", bundle: nil), forCellReuseIdentifier: "orderTableViewCell")
        
        getOrders()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "orderTableViewCell", for: indexPath) as? OrdersTableViewCell {
            
            let order = orders[indexPath.row]
            cell.updateView(order: order)
            
            return cell
        } else  {
            return OrdersTableViewCell()
        }
    }
    
    
    private func getOrders() {
        SVProgressHUD.show()
        
        let url = "\(Constant.BASE_URL)orders.php"
        let params = ["user_id" : MyUserDefault().getUserId()]
        Alamofire.request(url, method: .get, parameters: params).responseJSON {
            response in
            
            SVProgressHUD.dismiss()
            
            if response.result.isSuccess {
                let orderJSON = JSON(response.result.value!)
                
                let parsedOrders = Order.parseOrders(orderJSON: orderJSON["data"].arrayValue)
                
                self.orders = parsedOrders
            } else {
                
            }
        }
    }
   

}
