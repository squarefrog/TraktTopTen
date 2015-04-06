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
        
        if let file = NSBundle(forClass:ViewController.self).pathForResource("popular-movies", ofType: "json") {
            let data = NSData(contentsOfFile: file)!
            let items = MediaItemFactory().createMediaItems(data)
            dataSource = CollectionViewDataSource(items: items)
            delegate = CollectionViewDelegateFlowLayout()
            collectionView.dataSource = dataSource!
            collectionView.delegate = delegate!
        }
    }

}

