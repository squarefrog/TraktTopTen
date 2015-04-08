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
        assert(TraktAPIKey != "YOUR-API-KEY", "Add your API key above")
        
        let url = NSURL(string: UrlString)!
        let request = topMoviesURLRequest(url)
        var session = NSURLSession.sharedSession()
        var task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            let httpResponse = response as NSHTTPURLResponse
            
            if error != nil {
                callback(nil, "Error \(httpResponse): \(error.localizedDescription)")
            } else {
                callback(data, nil)
            }
        }
        task.resume()
    }
    
    func topMoviesURLRequest(url: NSURL) -> NSMutableURLRequest {
        var request = NSMutableURLRequest(URL: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("2", forHTTPHeaderField: "trakt-api-version")
        request.addValue(TraktAPIKey, forHTTPHeaderField: "trakt-api-key")
        return request
    }
}