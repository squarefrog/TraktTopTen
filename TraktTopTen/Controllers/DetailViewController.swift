//
//  DetailViewController.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 24/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var detailView: MediaItemsDetailsView!
    var mediaItem: MediaItem?
    var backgroundImageView: UIImageView
    var headerImageView: UIImageView
    
    var headerHeight = 0.0
    
    required init(coder aDecoder: NSCoder) {
        backgroundImageView = UIImageView()
        headerImageView = UIImageView()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.applicationBackgroundColour()
        
        scrollView.delegate = self;
        setupBackgroundImageView()
        setupHeaderImageView()
        setupDetailView()
        addLayoutConstraints()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        let width = Double(CGRectGetWidth(self.view.bounds))
        headerHeight = width * 0.5625
        
        scrollView.contentOffset = CGPoint(x: 0, y: -headerHeight)
        var insets = scrollView.contentInset
        insets.top = CGFloat(headerHeight)
        scrollView.contentInset = insets
        
        headerImageView.frame = CGRect(x: 0, y: 0, width: width, height: -headerHeight)
        
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
        scrollView.insertSubview(headerImageView, belowSubview: backgroundImageView)
        headerImageView.contentMode = .ScaleAspectFill
    }
    
    private func setupDetailView() {
        detailView = NSBundle.mainBundle().loadNibNamed("MediaItemDetailsView",
            owner: self, options: nil)[0] as? MediaItemsDetailsView
        addToScrollView(detailView)
    }
    
    private func addLayoutConstraints() {
        let views = ["dv": detailView]
        
        let horizontalConstraints =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|[dv]|",
            options: NSLayoutFormatOptions(0),
            metrics: nil,
            views: views)
        
        let verticalConstraints =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|[dv]|",
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
            backgroundImageView.hnk_setImageFromURL(mediaItem.poster)
            headerImageView.hnk_setImageFromURL(mediaItem.fanart)
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        let height: CGFloat = y * -1
        
        if y < 0 {
            var frame = headerImageView.frame
            headerImageView.frame = CGRect(x: 0, y: y, width: frame.width, height: height)
        }
    }
}