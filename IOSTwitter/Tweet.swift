//
//  Tweet.swift
//  IOSTwitter
//
//  Created by Mo, Kevin on 10/4/15.
//  Copyright © 2015 Mo, Kevin. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var user : User?
    var text : String?
    var createdAtString: String?
    var createdAt: NSDate?
    var dictionary : NSDictionary?
    var retweetCount : Int?
    var faveCount : Int?
    var tweetId: Int?
    
    init(dictionary: NSDictionary) {
        user = User(dictionary: dictionary["user"] as! NSDictionary)
        text = dictionary["text"] as? String
        createdAtString = dictionary["created_at"] as? String
        retweetCount = dictionary["retweet_count"] as? Int
        faveCount = dictionary["favourites_count"] as? Int
        tweetId = dictionary["id"] as? Int
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:SS Z y"
        createdAt = formatter.dateFromString(createdAtString!)
    }
    
    class func tweetsWithArray(array: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in array {
            tweets.append(Tweet(dictionary: dictionary))
        }
        
        return tweets
    }
}
