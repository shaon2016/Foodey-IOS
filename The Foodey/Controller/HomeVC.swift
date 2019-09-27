//
//  HomeVC.swift
//  The Foodey
//
//  Created by MacBook Pro  on 23/9/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit

class HomeVC: UITableViewController, updateFoodTableViewDelegate{
    
   

    override func viewDidLoad() {
        super.viewDidLoad()

        initVar()
        initView()
    }
    

    
    func initVar() {
        
    }
    
    func initView() {
        DataService.instance.foodTableViewReloadDelegate = self
       
        DataService.instance.loadFoods()
    
    }
    
    // MARK: TableView delegate and datasource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getFoods().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as? FoodCell {
            let food = DataService.instance.getFoods()[indexPath.row]
            cell.updateViews(f: food)
            
            return cell
        }
        else {
            return FoodCell()
        }
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    func foodFromServerLoadDone() {
       tableView.reloadData()
    }

}
