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
        
        for (_, subJson): (String, JSON) in json {
            let item = MediaItem(json: subJson)
            mediaItems.append(item)
        }
        
        return mediaItems
    }
    
}
