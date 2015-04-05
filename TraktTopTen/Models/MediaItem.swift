//
//  MediaItem.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 05/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import Foundation

class MediaItem {
    let title: String
    let year: Int
    let slug: String
    let banner: String
    
    init(title: String, year: Int, slug: String, banner: String) {
        self.title = title
        self.year = year
        self.slug = slug
        self.banner = banner
    }
}