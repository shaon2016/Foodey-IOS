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
        case Main
        case Auth
    }
    
    class func storyboard(storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.rawValue, bundle: bundle)
    }
}
