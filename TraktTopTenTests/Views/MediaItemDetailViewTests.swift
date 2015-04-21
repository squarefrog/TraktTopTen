//
//  MediaItemDetailViewTests.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 19/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import Foundation

class MediaItemDetailViewTests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        recordMode = false
    }
    
    func testViewLooksCorrect() {
        if let view = NSBundle.mainBundle().loadNibNamed("MediaItemDetailsView", owner: self, options: nil)[0] as? UIView {
            
            view.setTranslatesAutoresizingMaskIntoConstraints(false)
            
            let parentView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
            let bundle = NSBundle(forClass: MediaItemDetailViewTests.self)
            let image = UIImage(contentsOfFile: bundle.pathForResource("example_poster", ofType: "jpg")!)
            let imageView = UIImageView(frame: parentView.frame)
            imageView.image = image
            parentView.addSubview(imageView)
            parentView.addSubview(view)
            
            let leading = NSLayoutConstraint(
                item: view,
                attribute: .Leading,
                relatedBy: .Equal,
                toItem: parentView,
                attribute: .Leading,
                multiplier: 1.0,
                constant: 0)
            
            let trailing = NSLayoutConstraint(
                item: view,
                attribute: .Trailing,
                relatedBy: .Equal,
                toItem: parentView,
                attribute: .Trailing,
                multiplier: 1.0,
                constant: 0)
            
            let bottom = NSLayoutConstraint(
                item: view,
                attribute: .Bottom,
                relatedBy: .Equal,
                toItem: parentView,
                attribute: .Bottom,
                multiplier: 1.0,
                constant: 0)
            
            parentView.addConstraints([leading,trailing,bottom])
            
            // Currently fails to render the blur effect
            snapshotVerifyView(parentView, withIdentifier: nil)
            
        } else {
            XCTFail("Failed to load MediaItemDetailsView.xib")
        }
    }
    
}