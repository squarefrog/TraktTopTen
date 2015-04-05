//
//  MediaItemFactory.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 05/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import Foundation
import SwiftyJSON

class MediaItemFactory {
    
    func createMediaItems(data: NSData) -> [MediaItem] {
        var mediaItems: [MediaItem] = []
        let json = JSON(data:data)
        
        for (index: String, subJson: JSON) in json {
            let item = MediaItem(extractValues(subJson))
            mediaItems.append(item)
        }
        
        return mediaItems
    }
    
    func extractValues(json: JSON) -> (title: String, year: Int, slug: String, banner: String) {
        let title = json["title"].stringValue
        let year = json["year"].intValue
        let slug = json["ids"]["slug"].stringValue
        let banner = json["images"]["banner"]["full"].stringValue
        
        return (title, year, slug, banner)
    }
}
