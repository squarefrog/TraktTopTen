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
            var item = MediaItem(extractValues(subJson))
            mediaItems.append(item)
        }
        
        return mediaItems
    }
    
    private func extractValues(json: JSON) -> (title: String, year: Int, slug: String, banner: String) {
        var title = json["title"].stringValue
        var year = json["year"].intValue
        var slug = json["ids"]["slug"].stringValue
        var banner = json["images"]["banner"]["full"].stringValue
        
        return (title, year, slug, banner)
    }
}
