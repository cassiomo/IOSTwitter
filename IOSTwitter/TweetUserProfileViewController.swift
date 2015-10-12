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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
