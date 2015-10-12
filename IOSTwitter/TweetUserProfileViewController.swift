//
//  TweetUserProfileViewController.swift
//  IOSTwitter
//
//  Created by Mo, Kevin on 10/11/15.
//  Copyright © 2015 Mo, Kevin. All rights reserved.
//

import UIKit

class TweetUserProfileViewController: UIViewController {


    @IBOutlet weak var followersCounts: UILabel!
    @IBOutlet weak var followingCounts: UILabel!
    @IBOutlet weak var tweetsCounts: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var user : User! {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (user != nil) {
            followersCounts.text = "\(user.numFollowers!)"
            followingCounts.text = "\(user.numFollowing!)"
            tweetsCounts.text = "\(user.numTweets!)"
            screenNameLabel.text = "@\(user.screenname!)"
            nameLabel.text = user.name
            
            //profileImageView.setImageWithURL(NSURL(string : (User.currentUser?.profileImageUrl)!))

            profileImageView.setImageWithURL(NSURL(string: (user?.profileImageUrl!)!))
            backgroundImageView.setImageWithURL(NSURL(string: user.profileBGImageURL!))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
