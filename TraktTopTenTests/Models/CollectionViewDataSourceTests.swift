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
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let size = CGRect(x: 0, y: 0, width: 100, height: 100)
        collectionView = UICollectionView(frame: size, collectionViewLayout: layout)
        
        
        let movieA = Movie(title: "Title", year: 1980, slug: "", banner: "")
        let movieB = Movie(title: "", year: 1980, slug: "", banner: "")
        let items = [movieA, movieB]
        dataSource = CollectionViewDataSource(collectionView: collectionView!)
        dataSource.updateData(items)
    }
    
    func testNumberOfSectionsInCollectionView() {
        let sections = dataSource.numberOfSectionsInCollectionView(collectionView!)
        XCTAssert(sections == 1, "Data source should return 1 section")
    }
    
    func testNumberOfItemsInSection() {
        let items = dataSource.collectionView(collectionView!, numberOfItemsInSection: 0)
        XCTAssert(items == 2, "Data source should return 2 items")
    }
    
    // This crashes when attempting to dequeue a cell. It's as if the collection
    // view never registers the class properly
    func DISABLED_testDataSourceReturnsACell() {
        let indexPath = NSIndexPath(forItem: 0, inSection: 0)
        
        collectionView!.registerClass(MediaItemCell.self, forCellWithReuseIdentifier: "Cell")
        let cell = dataSource.collectionView(collectionView!, cellForItemAtIndexPath: indexPath) as MediaItemCell
        XCTAssert(cell.textLabel.text == "The Shawshank Redemption", "Data source should set cell text")
        
    }

}
