//
//  TweetComposeViewController.swift
//  IOSTwitter
//
//  Created by Mo, Kevin on 10/10/15.
//  Copyright © 2015 Mo, Kevin. All rights reserved.
//

import UIKit

class TweetComposeViewController: UIViewController {


    @IBAction func onCompose(sender: AnyObject) {
        if (tweetText.text != nil) {
            let paramDictionary: NSDictionary = ["status": tweetText.text]
            TwitterClient.sharedInstance.writePostWithParams(paramDictionary) { (tweet, error) -> () in
                if (tweet != nil) {
                    self.navigationController?.popViewControllerAnimated(true)
                }
            }
        }
        
    }
    
    
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profileViewImage: UIImageView!
    
    @IBOutlet weak var tweetText: UITextView!
    
    var tweet : Tweet! {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = User.currentUser?.name
        profileViewImage.setImageWithURL(NSURL(string : (User.currentUser?.profileImageUrl)!))
        screenName.text = User.currentUser?.screenname
        
        if (tweet != nil) {
            tweetText.text = "@\(tweet!.user?.screenname)"
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
