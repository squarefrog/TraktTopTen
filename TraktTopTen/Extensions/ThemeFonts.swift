//
//  ThemeFonts.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 06/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import UIKit

extension UIFont {
    
    class func applicationNavigatorBarFont() -> UIFont {
        return UIFont(name: "Avenir-Heavy", size: 19)!
    }
    
    class func mediaCellLabelFont() -> UIFont {
        return UIFont(name: "Avenir-Heavy", size: 15.0)!
    }
    
    class func mediaTaglineFont() -> UIFont {
        return UIFont(name: "Avenir-Light", size: 16.0)!
    }
    
    class func mediaSynopsisFont() -> UIFont {
        return UIFont(name: "Avenir-LightOblique", size: 16.0)!
    }
    
    class func mediaMetaDataFont() -> UIFont {
        return UIFont(name: "Avenir-Light", size: 15.0)!
    }
    
}
