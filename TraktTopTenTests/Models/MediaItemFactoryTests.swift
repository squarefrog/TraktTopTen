//
//  MediaItemFactoryTests.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 05/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import UIKit
import XCTest

class MediaItemFactoryTests: XCTestCase {
    
    func testCreatingMediaItemFromJSONData() {
        if let file = NSBundle(forClass:MediaItemFactoryTests.self).pathForResource("popular-movies", ofType: "json") {
            let data = NSData(contentsOfFile: file)!
            let items = MediaItemFactory().createMediaItems(data)
            XCTAssert(items.count == 10, "Method should return the correct amout of results")
            
            let firstItem = items[0]
            XCTAssert(firstItem.title == "The Shawshank Redemption", "Item title not set")
            XCTAssert(firstItem.year == 1994, "Item year not set")
            XCTAssert(firstItem.slug == "the-shawshank-redemption-1994", "Item slug not set")
            XCTAssert(firstItem.banner?.absoluteString == "https://walter.trakt.us/images/movies/000/000/234/banners/original/fce1409e26.jpg", "Item banner not set")
            
            let secondItem = items[1]
            XCTAssert(secondItem.title == "Goodfellas", "Item title not set")
            XCTAssert(secondItem.year == 1990, "Item year not set")
            XCTAssert(secondItem.slug == "goodfellas-1990", "Item slug not set")
            XCTAssert(secondItem.banner?.absoluteString == "https://walter.trakt.us/images/movies/000/000/612/banners/original/5b958b1255.jpg", "Item banner not set")
        } else {
            XCTFail("JSON file could not be loaded")
        }
    }
    
}
