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
    var backgroundImageView: UIImageView
    var headerImageView: UIImageView
    
    required init(coder aDecoder: NSCoder) {
        backgroundImageView = UIImageView()
        headerImageView = UIImageView()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.applicationBackgroundColour()
        
        setupBackgroundImageView()
        setupHeaderImageView()
        setupDetailView()
        addLayoutConstraints()
        populateData()
    }
    
    private func addToScrollView(view: UIView) {
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        scrollView.addSubview(view)
    }
    
    private func setupBackgroundImageView() {
        addToScrollView(backgroundImageView)
        
        let views = ["v": backgroundImageView]
        let horizontal:[AnyObject]! = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|[v]|",
            options: NSLayoutFormatOptions(0),
            metrics: nil,
            views: views)
        
        let vertical:[AnyObject]! = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|[v]|",
            options: NSLayoutFormatOptions(0),
            metrics: nil,
            views: views)
        
        self.view.addConstraints(horizontal + vertical)
    }
    
    private func setupHeaderImageView() {
        headerImageView.backgroundColor = UIColor.applicationBackgroundColour()
        addToScrollView(headerImageView)
    }
    
    private func setupDetailView() {
        detailView = NSBundle.mainBundle().loadNibNamed("MediaItemDetailsView",
            owner: self, options: nil)[0] as? MediaItemsDetailsView
        addToScrollView(detailView)
    }
    
    private func addLayoutConstraints() {
        let views = ["dv": detailView, "hdr": headerImageView]
        
        let headerHorizontalConstraints =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|[hdr]|",
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
        
        let horizontalConstraints =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|[dv]|",
            options: NSLayoutFormatOptions(0),
            metrics: nil,
            views: views)
        
        let verticalConstraints =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|[hdr][dv]|",
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
    
    private func populateData() {
        if let mediaItem = mediaItem {
            self.title = mediaItem.title
            detailView.taglineLabel.text = mediaItem.tagline
            detailView.synopsisLabel.text = mediaItem.summary
            detailView.yearLabel.text = "\(mediaItem.year)"
            detailView.runtimeLabel.text = "\(mediaItem.runtime) mins"
            detailView.genresLabel.text = "\(mediaItem.genres)"
            detailView.ratingLabel.text = "\(mediaItem.ratingPercent)%"
            
            if let url = NSURL(string: mediaItem.poster) {
                backgroundImageView.hnk_setImageFromURL(url)
            }
            
            if let url = NSURL(string: mediaItem.fanart) {
                headerImageView.hnk_setImageFromURL(url)
            }
        }
    }
    
}