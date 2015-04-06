//
//  ThemeColours.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 06/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func applicationMainThemeColor() -> UIColor {
        return UIColor(red:0.27, green:0.8, blue:0.64, alpha:1)
    }
    
    class func applicationBackgroundColour() -> UIColor {
        return UIColor(red:0.14, green:0.14, blue:0.14, alpha:1)
    }
    
    class func applicationWhiteColour() -> UIColor {
        return UIColor(red:0.98, green:0.96, blue:0.96, alpha:1)
    }
    
    class func applicationLightGrayColour() -> UIColor {
        return UIColor(red:0.85, green:0.85, blue:0.85, alpha:1)
    }
    
    class func applicationTextBackgroundColour() -> UIColor {
        return UIColor.blackColor().colorWithAlphaComponent(0.7)
    }
    
}