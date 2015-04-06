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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Top Ten Movies"
        collectionView.backgroundColor = UIColor.applicationBackgroundColour()
        
        delegate = CollectionViewDelegateFlowLayout()
        collectionView.delegate = delegate!
        
        dataSource = CollectionViewDataSource(collectionView: collectionView)
        collectionView.dataSource = dataSource!
        
        fetchAndDisplayTopMovies()
    }
    
    func fetchAndDisplayTopMovies() {
        var data: NSData?
        var errorString: String?
        TraktAPIManager().fetchTopMovies { (data, errorString) -> Void in
            
            dispatch_async(dispatch_get_main_queue()) {
                if let unwrappedData: NSData = data {
                    let array = MediaItemFactory().createMediaItems(unwrappedData)
                    self.dataSource?.updateData(array)
                }
            }
        }
    }
}

