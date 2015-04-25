//
//  CollectionViewDataSourceTests.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 05/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import UIKit
import XCTest

class CollectionViewDataSourceTests: XCTestCase {
    
    var dataSource: CollectionViewDataSource!
    var collectionView: UICollectionView?
    
    override func setUp() {
        super.setUp()
        
        let size = CGRect(x: 0, y: 0, width: 100, height: 100)
        collectionView = UICollectionView(frame: size,
            collectionViewLayout: UICollectionViewFlowLayout())
        
        dataSource = CollectionViewDataSource(collectionView: collectionView!)
        let items = mockMediaItemArray()
        dataSource.updateData(mockMediaItemArray())
    }
    
    func testNumberOfSectionsInCollectionView() {
        let sections = dataSource.numberOfSectionsInCollectionView(collectionView!)
        XCTAssert(sections == 1, "Data source should return 1 section")
    }
    
    func testNumberOfItemsInSection() {
        let items = dataSource.collectionView(collectionView!, numberOfItemsInSection: 0)
        XCTAssert(items == 2, "Data source should return 2 items")
    }
    
    func DISABLED_testDataSourceReturnsACell() {
        collectionView!.dataSource = dataSource
        collectionView!.registerClass(MediaItemCell.self,
            forCellWithReuseIdentifier: "Cell")
        
        let indexPath = NSIndexPath(forItem: 0, inSection: 0)
        let cell = dataSource.collectionView(collectionView!, cellForItemAtIndexPath: indexPath) as! MediaItemCell
        
        XCTAssert(cell.textLabel.text == "The Shawshank Redemption", "Data source should set cell text")
    }
    
    // MARK: - Test Helper Functions
    func mockMediaItemArray() -> [MediaItem] {
        let item = MediaItem()
        return [item, item]
    }

}
