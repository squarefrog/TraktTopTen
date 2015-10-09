//
//  TraktAPIManager.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 06/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import Foundation
import Keys

private let URLString = "https://api-v2launch.trakt.tv/movies/popular?extended=full,images&page=1&limit=10"

class TraktAPIManager {
    
    private let session = NSURLSession.sharedSession()
    
    func fetchTopMovies(callback: (NSData?, String?) -> Void) {
        guard let url = NSURL(string: URLString) else {
            print("Could not create a URL.")
            return;
        }
        let request = topMoviesURLRequest(url)
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            let httpResponse = response as? NSHTTPURLResponse
            
            if error != nil {
                callback(nil, "Error \(httpResponse): \(error!.localizedDescription)")
            } else {
                callback(data, nil)
            }
        }
        task.resume()
    }
    
    func topMoviesURLRequest(url: NSURL) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(URL: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("2", forHTTPHeaderField: "trakt-api-version")
        request.addValue(self.traktAPIKey(), forHTTPHeaderField: "trakt-api-key")
        return request
    }

    private func traktAPIKey() -> String {
        let keys = TrakttoptenKeys()
        let key = keys.traktAPIKey()
        assert(key != "", "Ensure you add your Trakt API key to cocoapods-keys. See the README file for more details.")
        return key
    }
}
