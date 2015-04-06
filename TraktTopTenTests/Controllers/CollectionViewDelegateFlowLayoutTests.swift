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

    func testReturnsFullWidthCellSize() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let expectedSize = CGSizeMake(200, 100)
        let rect = CGRect(origin: CGPointMake(0, 0), size: expectedSize)
        let collectionView = UICollectionView(frame: rect, collectionViewLayout: layout)
        
        let delegate = CollectionViewDelegateFlowLayout()
        let indexPath = NSIndexPath(forItem: 0, inSection: 0)
        let size = delegate.collectionView(collectionView, layout: layout, sizeForItemAtIndexPath: indexPath)
        XCTAssert(size == expectedSize, "Delegate should set full width size for cell")
    }

}
