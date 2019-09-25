//
//  HomeVC.swift
//  The Foodey
//
//  Created by MacBook Pro  on 23/9/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource, updateFoodTableViewDelegate{
    
    @IBOutlet weak var foodTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initVar()
        initView()
    }
    

    
    func initVar() {
        
    }
    
    func initView() {
        foodTable.delegate = self
        foodTable.dataSource = self
        
        DataService.instance.foodTableViewReloadDelegate = self
       
        DataService.instance.loadFoods()
        
    }
    
    // MARK: TableView delegate and datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getFoods().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell") as? FoodCell {
            let food = DataService.instance.getFoods()[indexPath.row]
            cell.updateViews(f: food)
            
            return cell
        }
        else {
            return FoodCell()
        }
        
    }
  
    
    func foodFromServerLoadDone() {
        foodTable.reloadData()
    }

}