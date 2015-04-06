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
        
        let movie = Movie(title: "", year: 1980, slug: "", banner: "")
        let items = [movie]
        dataSource = CollectionViewDataSource(items: items)
    }
    
    func testNumberOfSectionsInCollectionView() {
        let sections = dataSource.numberOfSectionsInCollectionView(collectionView!)
        XCTAssert(sections == 1, "Data source should return 1 section")
    }
    
    func testNumberOfItemsInSection() {
        let items = dataSource.collectionView(collectionView!, numberOfItemsInSection: 0)
        XCTAssert(items == 1, "Data source should return 1 items")
    }

}
