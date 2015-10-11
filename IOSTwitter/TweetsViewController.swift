//
//  TweetsViewController.swift
//  IOSTwitter
//
//  Created by Mo, Kevin on 10/4/15.
//  Copyright © 2015 Mo, Kevin. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    var tweets : [Tweet]?
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func onLogout(sender: AnyObject) {
        
        User.currentUser?.logout()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        TwitterClient.sharedInstance.homeTimeLineWithCompletion(nil, completion: { (tweets, error) -> () in
            self.tweets = tweets
            self.tableView.reloadData()
        })
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetViewCell", forIndexPath: indexPath) as! TweetViewCell
        cell.tweet = tweets![indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tweets != nil) {
            return tweets!.count
        } else {
            return 0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
