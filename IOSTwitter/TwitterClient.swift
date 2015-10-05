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
    
    var loginCompletion: ((user: User?, error: NSError?) -> ())?
    
    class var sharedInstance : TwitterClient {
        struct Static {
            static let instance = TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
        }
        return Static.instance
    }
    
    func homeTimeLineWithCompletion(params: NSDictionary?, completion: (tweets: [Tweet]?, error: NSError) -> ()) {
        
        GET("1.1/statuses/home_timeline.json", parameters: params, success: { (operation:AFHTTPRequestOperation!, response:AnyObject!) -> Void in
            //print("home timeline: \(response)")
            let tweets = Tweet.tweetsWithArray(response as! [NSDictionary])
            
            completion(tweets: tweets, error: nil)
            
            for tweet in tweets {
                print("text: \(tweet.text), created: \(tweet.createdAt)")
            }
            }, failure: {(operation:AFHTTPRequestOperation!, error:NSError!) -> Void in
                print ("error getting home timeline")
                completion(tweets: nil, error: error)
        })
        
    }
    
    func loginWithCompletion(completion: (user: User?, error: NSError?) -> ()) {
        loginCompletion = completion
        
        
        // fetch request token & redirect to authorization page
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        TwitterClient.sharedInstance.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "cptwitterdemo://oauth"), scope: nil, success: { (requestToken: BDBOAuth1Credential!) -> Void in
            print("Got the request token")
            var authURL = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")
            UIApplication.sharedApplication().openURL(authURL!)
            
            }) {
                (error: NSError!) -> Void in
                print("Failed to get request token")
                self.loginCompletion!(user: nil, error: error)
        }
    }
    
    func openURL(url: NSURL) {
        fetchAccessTokenWithPath("oauth/access_token", method: "POST", requestToken:BDBOAuth1Credential(queryString: url.query), success: { (accessToken: BDBOAuth1Credential!) -> Void in
            print("Got the acesses token")
            TwitterClient.sharedInstance.requestSerializer.saveAccessToken(accessToken)
            
            
            TwitterClient.sharedInstance.GET("1.1/account/verify_credentials.json", parameters: nil, success: {(operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                //print("user:\(response)")
                let user = User(dictionary: response as! NSDictionary)
                
                // login user
                User.currentUser = user
                
                print("user: \(user.name)")
                self.loginCompletion?(user:user, error: nil)
                }
                , failure: { (operation:AFHTTPRequestOperation!, error:NSError!) -> Void in
                    print("error getting current user")
            })
            }) {
                (error: NSError!) -> Void in
                print("Failed to receive access token")
        }
    }

}
