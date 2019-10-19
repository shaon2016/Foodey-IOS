//
//  HomeVC.swift
//  The Foodey
//
//  Created by MacBook Pro  on 23/9/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate, updateFoodTableViewDelegate{
    
    private let dataService = DataService()
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

        dataService.foodTableViewReloadDelegate = self
       
        dataService.loadFoods()
    }
    
    // MARK: TableView delegate and datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataService.getFoods().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as? FoodCell {
            let food = dataService.getFoods()[indexPath.row]
            cell.updateViews(f: food)
            
            return cell
        }
        else {
            return FoodCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let food = dataService.getFoods()[indexPath.row]
        performSegue(withIdentifier: "goToFoodDetails", sender: food)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let foodDetailsVC = segue.destination as? FoodDetailsVC {
            foodDetailsVC.initFood(food: sender as! Food)
        }
    }
    
    
    func foodFromServerLoadDone() {
      foodTable.reloadData()
    }

}
