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
        let indexPath = NSIndexPath(forItem: 0, inSection: 0)
        
        let size = delegate.collectionView(collectionView!, layout: layout!, sizeForItemAtIndexPath: indexPath)
        
        let expectedSize = CGSizeMake(collectionViewSize.width, collectionViewSize.width * 0.185)
        XCTAssert(size == expectedSize, "Delegate should set full width size for cell")
    }
    
    // Well this is ugly...
    func testDelegateReturnsZeroInsets() {
        let insets = delegate.collectionView(collectionView!, layout: layout!, insetForSectionAtIndex: 0)
        let insetsString = NSStringFromUIEdgeInsets(insets)
        let expected = NSStringFromUIEdgeInsets(UIEdgeInsetsZero)
        XCTAssertEqual(insetsString, expected, "Delegate should set content insets")
    }
    
    func testDelegateReturnsMinimumLineSpacing() {
        let lineSpacing = delegate.collectionView(collectionView!, layout: layout!, minimumLineSpacingForSectionAtIndex: 0)
        XCTAssert(lineSpacing == delegate.spacing, "Delegate should return line spacing")
    }
    
    func testDelegateReturnsHeaderSize() {
        let expected = CGSizeMake(0, delegate.spacing)
        let size = delegate.collectionView(collectionView!, layout: layout!, referenceSizeForHeaderInSection: 0)
        
        XCTAssert(size == expected, "Delegate should return a header size")
    }

    func testDelegateReturnsFooterSize() {
        let expected = CGSizeMake(0, delegate.spacing)
        let size = delegate.collectionView(collectionView!, layout: layout!, referenceSizeForFooterInSection: 0)
        
        XCTAssert(size == expected, "Delegate should return a footer size")
    }
    
}
