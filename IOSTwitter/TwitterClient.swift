//
//  TwitterClient.swift
//  IOSTwitter
//
//  Created by Mo, Kevin on 10/2/15.
//  Copyright © 2015 Mo, Kevin. All rights reserved.
//

import UIKit

let twitterConsumerKey = "qWGbzWd9F5dLLA4smv5BflVFC"
let twitterConsumerSecret = "p47HtYoApOozOmbAUO9LPCyF2CzBdV8ue6uyECqsx6vioHyI5c"
let twitterBaseURL = NSURL(string: "https://api.twitter.com")

class TwitterClient: BDBOAuth1RequestOperationManager {
    
    class var sharedInstance : TwitterClient {
        struct Static {
            static let instance = TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
        }
        return Static.instance
    }

}
