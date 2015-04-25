//
//  MediaItemTests.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 05/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import UIKit
import XCTest
import SwiftyJSON

class MediaItemTests: XCTestCase {

    func testMediaItemCanBeInititialisedWithData() {
        let item = MediaItem(json: loadSampleData())
        XCTAssert(item.title == "The Shawshank Redemption", "MediaItem title not set");
        XCTAssert(item.year == 1994, "MediaItem year not set");
        XCTAssert(item.slug == "the-shawshank-redemption-1994", "MediaItem slug not set");
        XCTAssert(item.runtime == 142, "MediaItem run time not set");
        XCTAssert(item.genres == "Crime, Drama", "MediaItem genres not set")
        XCTAssert(item.ratingPercent == 93, "MediaItem rating not set");
        XCTAssert(item.tagline == "Stubbed tagline", "MediaItem tagline not set");
        XCTAssert(item.summary == "Stubbed overview", "MediaItem summary not set");
        XCTAssert(item.banner == "https://walter.trakt.us/banner_full.jpg", "MediaItem banner url not set");
        XCTAssert(item.fanart == "https://walter.trakt.us/fanart_thumb.jpg", "MediaItem fanart url not set");
        XCTAssert(item.poster == "https://walter.trakt.us/poster_thumb.jpg", "MediaItem thumb url not set");
    }
    
    func loadSampleData() -> JSON {
        let bundle = NSBundle(forClass: MediaItemTests.self)
        let file = bundle.pathForResource("single-movie", ofType: "json")!
        let data = NSData(contentsOfFile: file)!
        let json = JSON(data: data)
        return json[0]
    }

}
