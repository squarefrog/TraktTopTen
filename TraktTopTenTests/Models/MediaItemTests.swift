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

    func testMovieCanBeInitialised() {
        let mediaItem = MediaItem(title: "Bacon", year: 1980, slug: "bacon", banner: "bacon-movie.jpg")
        XCTAssertNotNil(mediaItem, "Movie should not be nil")
        XCTAssert(mediaItem.title == "Bacon", "Movie title not set");
        XCTAssert(mediaItem.year == 1980, "Movie year not set");
        XCTAssert(mediaItem.slug == "bacon", "Movie slug not set");
        XCTAssert(mediaItem.banner == "bacon-movie.jpg", "Movie banner url not set");
    }

}
