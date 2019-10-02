//
//  VCExt.swift
//  The Foodey
//
//  Created by MacBook Pro  on 2/10/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit

extension UIViewController {
    open func pushVC(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
    open func popVC() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    open func popToRootVC() {
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    open func presentVC(_ vc: UIViewController) {
        present(vc, animated: true, completion: nil)
    }
    
    func goToRoot() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.setRootVC()
    }
    
    func goToLoginVC() {
        let vc = UIStoryboard.storyboard(storyboard: .Auth).instantiateViewController(withIdentifier: "loginVC")
        presentVC(vc)
    }
}
