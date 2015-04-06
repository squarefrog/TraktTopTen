//
//  CollectionViewDelegateFlowLayout.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 06/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import UIKit

class CollectionViewDelegateFlowLayout : NSObject, UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = CGRectGetWidth(collectionView.bounds)
        return CGSizeMake(width, 100)
    }
    
}
