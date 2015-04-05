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
    
    let itemTitle = "The Shawshank Redemption"
    let itemYear = 1994
    let itemSlug = "the-shawshank-redemption-1994"
    let itemBanner = "https://walter.trakt.us/images/movies/000/000/234/banners/original/fce1409e26.jpg"

    func testCreatingMediaItemFromJSONData() {
        if let file = NSBundle(forClass:MediaItemFactoryTests.self).pathForResource("popular-movies", ofType: "json") {
            let data = NSData(contentsOfFile: file)!
            let items = MediaItemFactory().createMediaItems(data)
            XCTAssert(items.count == 1, "Method should return a single result")
            
            let item = items.first!
            XCTAssert(item.title == itemTitle, "Item title not set")
            XCTAssert(item.year == itemYear, "Item year not set")
            XCTAssert(item.slug == itemSlug, "Item slug not set")
            XCTAssert(item.banner == itemBanner, "Item banner not set")
        } else {
            XCTFail("JSON file could not be loaded")
        }
    }
    
}
