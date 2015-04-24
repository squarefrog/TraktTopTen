//
//  MediaItemTests.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 05/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import UIKit
import XCTest

class MediaItemTests: XCTestCase {

    let mediaItem = MediaItem(title: "Bacon",
        year: 1980, slug: "bacon", banner: "bacon-movie.jpg")
    
    func testMediaItemCanBeInitialised() {
        XCTAssertNotNil(mediaItem, "MediaItem should not be nil")
        XCTAssert(mediaItem.title == "Bacon", "MediaItem title not set");
        XCTAssert(mediaItem.year == 1980, "MediaItem year not set");
        XCTAssert(mediaItem.slug == "bacon", "MediaItem slug not set");
        XCTAssert(mediaItem.banner == "bacon-movie.jpg", "Movie banner url not set");
    }
    
    func testMediaItemHasAdditionalDetails() {
        let runtime = 123
        let genres = ["Action", "Comedy"]
        let rating = 78
        
        mediaItem.runtime = runtime
        mediaItem.genres = genres
        mediaItem.rating = rating
        
        XCTAssert(mediaItem.runtime! == runtime, "MediaItem should have a run time");
        XCTAssert(mediaItem.genres! == genres, "MediaItem should have an array of genres");
        XCTAssert(mediaItem.rating! == rating, "MediaItem should have a rating");
    }

}
