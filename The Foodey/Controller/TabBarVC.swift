//
//  TabBarVC.swift
//  The Foodey
//
//  Created by MacBook Pro  on 20/10/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController, UITabBarControllerDelegate {
    
    private var loadCurrentIndex  = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedIndex = loadCurrentIndex
    }
    
    func setCurrentTabBarIndex(loadTabBarIndex currentIndex : Int) {
        loadCurrentIndex = currentIndex
    }
    
    
}
