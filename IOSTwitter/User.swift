//
//  User.swift
//  IOSTwitter
//
//  Created by Mo, Kevin on 10/4/15.
//  Copyright © 2015 Mo, Kevin. All rights reserved.
//

import UIKit

var _currentUser: User?
let currentUserKey = "kCurrentUserKey"
let userDidLoginNotification = "userDidLoginNotification"
let userDidLogoutNotification = "userDidLogoutNotification"


class User: NSObject {
    var name : String?
    var screenname: String?
    var profileImageUrl: String?
    var tagline: String?
    var dictionary: NSDictionary
    var numTweets: Int?
    var numFollowers: Int?
    var numFollowing: Int?
    var profileBGImageURL: String?
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        profileImageUrl = dictionary["profile_image_url"] as? String
        tagline = dictionary["description"] as? String
        numTweets = dictionary["statuses_count"] as? Int
        numFollowers = dictionary["followers_count"] as? Int
        numFollowing = dictionary["friends_count"] as? Int
        profileBGImageURL = dictionary["profile_background_image_url"] as? String
    }
    
    func logout() {
        User.currentUser = nil
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        
        NSNotificationCenter.defaultCenter().postNotificationName(userDidLogoutNotification, object: nil)
        
    }
    
    class var currentUser: User? {
        get {
            if _currentUser == nil {
                let data  = NSUserDefaults.standardUserDefaults().objectForKey(currentUserKey) as? NSData
                if data != nil {
                    do {
                        let dictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: [])
                        _currentUser = User(dictionary: dictionary as! NSDictionary)
                    } catch {
        
                    }
                }
            }
            return _currentUser
        }
        
        set (user){
            _currentUser = user
            
            if _currentUser != nil {
                do {
                    let data =  try NSJSONSerialization.dataWithJSONObject((user?.dictionary)!, options: [])
                    NSUserDefaults.standardUserDefaults().setObject(data, forKey: currentUserKey)
                    NSUserDefaults.standardUserDefaults().synchronize()
                } catch {
                    
                }
            } else {
                NSUserDefaults.standardUserDefaults().synchronize()
            }
        }
    }
}
