//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/17/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import Foundation

class User {
    
    static var current: User?
    var name: String
    var screenName: String
    var numFollowers: Int
    var numFavorites: Int
    var totalTweets: Int
    
    init(dictionary: [String: Any]) {
        name = dictionary["name"] as! String
        screenName = dictionary["screen_name"] as! String
        numFollowers = dictionary["followers_count"] as! Int
        numFavorites = dictionary["favorties_count"] as! Int
        totalTweets = dictionary["statuses_count"] as! Int
    }
}
