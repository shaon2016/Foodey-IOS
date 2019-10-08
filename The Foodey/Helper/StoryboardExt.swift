//
//  StoryboardExt.swift
//  The Foodey
//
//  Created by MacBook Pro  on 2/10/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit

extension UIStoryboard {
    enum Storyboard : String {
        case Nav
        case Auth
        case Main
        case Cart
    }
    
    class func storyboard(storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.rawValue, bundle: bundle)
    }
}
