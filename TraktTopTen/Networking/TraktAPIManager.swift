//
//  TraktAPIManager.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 06/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import Foundation

let UrlString = "https://api-v2launch.trakt.tv/movies/popular?extended=images&page=1&limit=10"
let TraktAPIKey = "YOUR-API-KEY"

class TraktAPIManager {
    func fetchTopMovies(callback: (NSData?, String?) -> Void) {
        assert(TraktAPIKey != "YOUR-API-KEY", "You need to add your API key in line 12")
        
        var session = NSURLSession.sharedSession()
        
        if let url = NSURL(string: UrlString) {
            let request = topMoviesURLRequest(url)
            var task = session.dataTaskWithRequest(request) {
                (data, response, error) -> Void in
                if error != nil {
                    callback(nil, error.localizedDescription)
                } else {
                    if let httpResponse = response as? NSHTTPURLResponse {
                        if httpResponse.statusCode != 200 {
                            let statusCode = httpResponse.statusCode
                            callback(nil, "Error: API returned \(statusCode)")
                        } else {
                            callback(data, nil)
                        }
                    }
                }
            }
            task.resume()
        } else {
            callback(nil, "Error creating Trakt URL")
        }
    }
    
    func topMoviesURLRequest(url: NSURL) -> NSMutableURLRequest {
        var request = NSMutableURLRequest(URL: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("2", forHTTPHeaderField: "trakt-api-version")
        request.addValue(TraktAPIKey, forHTTPHeaderField: "trakt-api-key")
        return request
    }
}