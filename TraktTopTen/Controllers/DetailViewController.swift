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
    var headerImageView: UIImageView
    
    required init(coder aDecoder: NSCoder) {
        imageView = UIImageView()
        headerImageView = UIImageView()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.applicationBackgroundColour()
        
        addImageView()
        setupHeaderImageView()
        
        detailView = NSBundle.mainBundle().loadNibNamed("MediaItemDetailsView", owner: self, options: nil)[0] as? MediaItemsDetailsView
        detailView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.scrollView.addSubview(detailView)
        
        addLayoutConstraints()
        
        populateData()
    }
    
    func addImageView() {
        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        scrollView.addSubview(imageView)
        
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
    
    func setupHeaderImageView() {
        headerImageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        scrollView.addSubview(headerImageView)
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
            
            if let url = NSURL(string: mediaItem.fanart) {
                headerImageView.hnk_setImageFromURL(url)
            }
        }
    }
    
    func addLayoutConstraints() {
        let views = ["v": detailView, "h": headerImageView]
        
        let headerHorizontalConstraints:[AnyObject]! = NSLayoutConstraint.constraintsWithVisualFormat("H:|[h]|",
            options: NSLayoutFormatOptions(0),
            metrics: nil,
            views: views)
        
        let headerHeight = NSLayoutConstraint(
            item: headerImageView,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: scrollView,
            attribute: NSLayoutAttribute.Width,
            multiplier: 0.5625,
            constant: 0)
        
        let horizontalConstraints:[AnyObject]! = NSLayoutConstraint.constraintsWithVisualFormat("H:|[v]|",
            options: NSLayoutFormatOptions(0),
            metrics: nil,
            views: views)
        
        let verticalConstraints:[AnyObject]! = NSLayoutConstraint.constraintsWithVisualFormat("V:|[h][v]|",
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
        
        var scrollViewConstraints = horizontalConstraints
        scrollViewConstraints.extend(verticalConstraints)
        scrollViewConstraints.extend(headerHorizontalConstraints)
        scrollViewConstraints.append(headerHeight)
        
        self.scrollView.addConstraints(scrollViewConstraints)
        
        self.view.addConstraint(widthConstraint)
        self.view.layoutIfNeeded()
    }
    
}