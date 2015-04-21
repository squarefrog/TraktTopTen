//
//  SynopsisBackgroundView.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 21/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import UIKit

class SynopsisBackgroundView: UIView {
    
    override func drawRect(rect: CGRect) {
        
        UIColor(white: 0.0, alpha: 0.1).setFill()
        UIRectFill(rect)
        
        let borderColour = UIColor(white: 1.0, alpha: 0.1)
        
        // Add a top border
        let topRect = CGRect(
            x: 0,
            y: 0,
            width: CGRectGetWidth(self.bounds),
            height: 1)
        
        let topPath = UIBezierPath(rect: topRect)
        borderColour.setFill()
        topPath.fill()
        
        // Add a bottom border
        let bottomRect = CGRect(
            x: 0,
            y: CGRectGetHeight(self.bounds) - 1,
            width: CGRectGetWidth(self.bounds),
            height: 1)
        
        let bottomPath = UIBezierPath(rect: bottomRect)
        bottomPath.fill()
        
    }
    
}