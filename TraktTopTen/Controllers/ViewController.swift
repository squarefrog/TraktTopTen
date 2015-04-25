//
//  ViewController.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 04/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource: CollectionViewDataSource?
    var delegate: CollectionViewDelegateFlowLayout?
    var activityIndicator: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Top Ten Movies"
        
        setupCollectionView()
        fetchAndDisplayTopMovies()
        showActivityIndicatorView()
    }
    
    func showActivityIndicatorView() {
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
        activityIndicator?.startAnimating()
        activityIndicator?.color = UIColor.applicationLightGrayColour()
        activityIndicator?.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(activityIndicator!)
        
        let centerX = NSLayoutConstraint(
            item: activityIndicator!,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .CenterX,
            multiplier: 1.0,
            constant: 0.0)

        let centerY = NSLayoutConstraint(
            item: activityIndicator!,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .CenterY,
            multiplier: 1.0,
            constant: 0.0)
        
        self.view.addConstraints([centerX, centerY])
    }
    
    func setupCollectionView() {
        delegate = CollectionViewDelegateFlowLayout()
        collectionView.delegate = delegate!
        
        dataSource = CollectionViewDataSource(collectionView: collectionView)
        collectionView.dataSource = dataSource!
        
        collectionView.backgroundColor = UIColor.applicationBackgroundColour()
    }
    
    func fetchAndDisplayTopMovies() {
        var data: NSData?
        var errorString: String?
        let application = UIApplication.sharedApplication()
        application.networkActivityIndicatorVisible = true
        
        TraktAPIManager().fetchTopMovies { (data, errorString) -> Void in
            application.networkActivityIndicatorVisible = false
            
            dispatch_async(dispatch_get_main_queue()) {
                if let unwrappedData: NSData = data {
                    let array = MediaItemFactory().createMediaItems(unwrappedData)
                    self.dataSource?.updateData(array)
                    self.activityIndicator?.removeFromSuperview()
                } else if let error = errorString {
                    println("\(error)")
                }
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath = collectionView.indexPathsForSelectedItems()[0] as! NSIndexPath
        if let mediaItem = dataSource?.mediaItemForIndexPath(indexPath) {
            
            let viewController = segue.destinationViewController as! DetailViewController
            viewController.mediaItem = mediaItem
            
        }
    }
}

