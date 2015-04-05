//
//  MovieTests.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 04/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import UIKit
import XCTest

class MovieTests: XCTestCase {

    func testMovieCanBeInitialised() {
        let movie = Movie(title: "Bacon", year: 1980, slug: "bacon", banner: "bacon-movie.jpg")
        XCTAssertNotNil(movie, "Movie should not be nil")
        XCTAssert(movie.title == "Bacon", "Movie title not set");
        XCTAssert(movie.year == 1980, "Movie year not set");
        XCTAssert(movie.slug == "bacon", "Movie slug not set");
        XCTAssert(movie.banner == "bacon-movie.jpg", "Movie banner url not set");
    }
    
}
