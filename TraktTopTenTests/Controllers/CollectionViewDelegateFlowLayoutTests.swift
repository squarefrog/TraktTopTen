//
//  CollectionViewDelegateFlowLayoutTests.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 06/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import UIKit
import XCTest

class CollectionViewDelegateFlowLayoutTests: XCTestCase {
    
    var layout: UICollectionViewFlowLayout?
    var collectionView: UICollectionView?
    let expectedSize = CGSizeMake(200, 100)
    let delegate = CollectionViewDelegateFlowLayout()
    
    override func setUp() {
        super.setUp()
        
        layout = UICollectionViewFlowLayout()
        let rect = CGRect(origin: CGPointMake(0, 0), size: expectedSize)
        collectionView = UICollectionView(frame: rect, collectionViewLayout: layout!)
    }

    func testReturnsFullWidthCellSize() {
        
        let indexPath = NSIndexPath(forItem: 0, inSection: 0)
        let size = delegate.collectionView(collectionView!, layout: layout!, sizeForItemAtIndexPath: indexPath)
        XCTAssert(size == expectedSize, "Delegate should set full width size for cell")
    }
    
//    func testsDelegateReturnsZeroInsets() {
//        var insets = delegate.collectionView(collectionView!, layout: layout!, insetForSectionAtIndex: 0)
//        XCTAssert(insets == UIEdgeInsetsZero, "Delegate should return zero insets for section")
//    }

}
