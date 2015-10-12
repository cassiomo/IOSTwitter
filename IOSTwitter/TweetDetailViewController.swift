//
//  TweetDetailViewController.swift
//  IOSTwitter
//
//  Created by Mo, Kevin on 10/10/15.
//  Copyright © 2015 Mo, Kevin. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {

    @IBOutlet weak var profileViewImage: UIImageView!
    
    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var name: UILabel!
    
    
    @IBOutlet weak var favoriteCounts: UILabel!
    @IBOutlet weak var tweetCounts: UILabel!
    
    @IBOutlet weak var tweetCreated: UILabel!
    var tweet : Tweet! {
        didSet{
         
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (tweet.retweetCount != nil && tweet.retweetCount > 0) {
            self.tweetCounts.text = "\(tweet.retweetCount!)"
        }
        if (tweet.retweetCount != nil && tweet.faveCount > 0){
            self.favoriteCounts.text = "\(tweet.faveCount)"
        }
        self.profileViewImage.setImageWithURL(NSURL(string: (tweet.user?.profileImageUrl)!))
        self.tweetCreated.text = tweet.createdAtString
        self.screenName.text = "@\(tweet.user!.screenname!)"
        self.name.text = tweet.user?.name
        self.tweetText.text = tweet.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
