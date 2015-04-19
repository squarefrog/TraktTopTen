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
        recordMode = true
    }
    
    func testViewLooksCorrect() {
        if let view = NSBundle.mainBundle().loadNibNamed("MediaItemDetailsView", owner: self, options: nil)[0] as? UIView {
            
            view.frame = CGRect(x: 0, y: 275, width: 375, height: 392)
            
            let parentView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
            let bundle = NSBundle(forClass: MediaItemDetailViewTests.self)
            let image = UIImage(contentsOfFile: bundle.pathForResource("example_poster", ofType: "jpg")!)
            let imageView = UIImageView(frame: parentView.frame)
            imageView.image = image
            parentView.addSubview(imageView)
            parentView.addSubview(view)
            
            // Currently fails to render the blur effect
            snapshotVerifyView(parentView, withIdentifier: nil)
            
        }
    }
    
}