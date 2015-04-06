//
//  CollectionViewDataSource.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 05/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import UIKit

class CollectionViewDataSource : NSObject, UICollectionViewDataSource {
    
    private var items = [MediaItem]()
    
    init(items: [MediaItem]) {
        self.items = items
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as MediaItemCell
        let movie = self.items[indexPath.row]
        cell.textLabel.text = "\(movie.title)"
        
        return cell
    }
    
}
