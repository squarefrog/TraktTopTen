//
//  DetailViewController.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 24/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var detailView: MediaItemsDetailsView!
    var mediaItem: MediaItem?
    var imageView: UIImageView
    
    required init(coder aDecoder: NSCoder) {
        imageView = UIImageView()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        
        addImageView()
        self.view.backgroundColor = UIColor.applicationBackgroundColour()
        
        detailView = NSBundle.mainBundle().loadNibNamed("MediaItemDetailsView", owner: self, options: nil)[0] as? MediaItemsDetailsView
        detailView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.scrollView.addSubview(detailView)
        
        let views = ["v": detailView]
        let horizontalConstraints:[AnyObject]! = NSLayoutConstraint.constraintsWithVisualFormat("|[v]|",
            options: NSLayoutFormatOptions(0),
            metrics: nil,
            views: views)
        
        let verticalConstraints:[AnyObject]! = NSLayoutConstraint.constraintsWithVisualFormat("V:|[v]|",
            options: NSLayoutFormatOptions(0),
            metrics: nil,
            views: views)
        
        let widthConstraint = NSLayoutConstraint(
            item: detailView,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1.0,
            constant: 0)
        
        self.scrollView.addConstraints(horizontalConstraints + verticalConstraints)
        self.view.addConstraint(widthConstraint)
        
        populateData()
    }
    
    func addImageView() {
        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.insertSubview(imageView, belowSubview: scrollView)
        
        let views = ["v": imageView]
        let hConstraints:[AnyObject]! = NSLayoutConstraint.constraintsWithVisualFormat(
            "|[v]|",
            options: NSLayoutFormatOptions(0),
            metrics: nil,
            views: views)
        
        let vConstraints:[AnyObject]! = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|[v]|",
            options: NSLayoutFormatOptions(0),
            metrics: nil,
            views: views)
        
        self.view.addConstraints(hConstraints)
        self.view.addConstraints(vConstraints)
        
        self.view.layoutIfNeeded()
    }
    
    func populateData() {
        if let mediaItem = mediaItem {
            self.title = mediaItem.title
            detailView.taglineLabel.text = mediaItem.tagline
            detailView.synopsisLabel.text = mediaItem.summary
            detailView.yearLabel.text = "\(mediaItem.year)"
            detailView.runtimeLabel.text = "\(mediaItem.runtime) mins"
            detailView.genresLabel.text = "\(mediaItem.genres)"
            detailView.ratingLabel.text = "\(mediaItem.ratingPercent)%"
            if let url = NSURL(string: mediaItem.poster) {
                imageView.hnk_setImageFromURL(url)
            }
        }
    }
    
}