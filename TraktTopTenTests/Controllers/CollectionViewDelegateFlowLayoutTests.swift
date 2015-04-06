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
    let collectionViewSize = CGSizeMake(200, 100)
    let delegate = CollectionViewDelegateFlowLayout()
    
    override func setUp() {
        super.setUp()
        layout = UICollectionViewFlowLayout()
        let rect = CGRect(origin: CGPointMake(0, 0), size: collectionViewSize)
        collectionView = UICollectionView(frame: rect, collectionViewLayout: layout!)
    }

    func testDelegateReturnsFullWidthCellSize() {
        
        let expectedSize = CGSizeMake(collectionViewSize.width, collectionViewSize.width * 0.185)
        let indexPath = NSIndexPath(forItem: 0, inSection: 0)
        let size = delegate.collectionView(collectionView!, layout: layout!, sizeForItemAtIndexPath: indexPath)
        XCTAssert(size == expectedSize, "Delegate should set full width size for cell")
    }
    
    // FIXME: Gives Ambiguous use of 'collectionView' warning. Why?
    func DISABLED_testDelegateReturnsMinimumLineSpacing() {
//        let spacing = delegate.collectionView(collectionView!, layout: layout!, minimumInteritemSpacingForSectionAtIndex: 0)
//        XCTAssert(spacing == 10, "Delegate should set line spacing")
    }
    
    // Well this is ugly...
    func testsDelegateReturnsZeroInsets() {
        var insets = delegate.collectionView(collectionView!, layout: layout!, insetForSectionAtIndex: 0)
        let insetsString = NSStringFromUIEdgeInsets(insets)
        let expected = NSStringFromUIEdgeInsets(UIEdgeInsetsZero)
        XCTAssertEqual(insetsString, expected, "Delegate should set content insets")
    }

}
