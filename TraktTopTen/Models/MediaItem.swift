//
//  MediaItem.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 05/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import Foundation
import SwiftyJSON

class MediaItem {
    var title: String
    var year: Int
    var slug: String
    var banner: String
    var fanart: String
    var poster: String
    
    var runtime: Int
    var genres: [String]
    var tagline: String
    var summary: String
    
    private var rating: Float
    var ratingPercent: Int {
        get {
            return Int(rating * 10)
        }
    }
    
    init() {
        self.title = ""
        self.year = 0
        self.slug = ""
        self.banner = ""
        self.fanart = ""
        self.poster = ""
        self.runtime = 0
        self.genres = []
        self.rating = 0.0
        self.tagline = ""
        self.summary = ""
    }
    
    convenience init(json: JSON) {
        self.init()
        
        title = json["title"].stringValue
        year = json["year"].intValue
        slug = json["ids"]["slug"].stringValue
        runtime = json["runtime"].intValue
        tagline = json["tagline"].stringValue
        summary = json["overview"].stringValue
        rating = json["rating"].floatValue
        
        banner = json["images"]["banner"]["full"].stringValue
        fanart = json["images"]["fanart"]["thumb"].stringValue
        poster = json["images"]["poster"]["thumb"].stringValue
        
        for (index: String, genre: JSON) in json["genres"] {
            genres.append(genre.stringValue)
        }
    }
    
}
