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
    
    func showAlert(alertControllerTitle : String, alertControllerMsg : String, positiveBtnTitle : String = "Yes", handler: ((UIAlertAction) -> Void)? = nil , isToShowCancel : Bool = false) {
        let alert = UIAlertController(title: alertControllerTitle, message: alertControllerMsg, preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: positiveBtnTitle, style: .default) { (action) in
            handler?(action)
        }
        alert.addAction(yesAction)
        
        if isToShowCancel == true {
             let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
        }
        
        present(alert, animated: true, completion: nil)
    }
}
