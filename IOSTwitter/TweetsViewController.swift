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
    var refreshControl:UIRefreshControl!
    
    // Pan gesture start storage
    var leftViewBeginGestureCenter: CGPoint!
    
    // Nav menu X boundaries (of the center)
    var leftViewLeftBound:  CGPoint!
    var leftViewRightBound: CGPoint!
    
//    var profileUser : User?
    
    
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func onLogout(sender: AnyObject) {
        
        User.currentUser?.logout()
    }
    
    @IBAction func onSwipe(sender: UIPanGestureRecognizer) {
        print("Swiping....")
        
        switch sender.state {
            case .Began:
                // set to center
                self.leftViewBeginGestureCenter = self.leftView.center
            case .Changed:
                let positionChange = sender.translationInView(self.view)
                var newPoint = CGPoint(
                    x: self.leftViewBeginGestureCenter.x + positionChange.x,
                    y: self.leftViewBeginGestureCenter.y
                )
                
                // new point to the left view bound and right view bound
                if newPoint.x < leftViewLeftBound.x {
                    newPoint.x = leftViewLeftBound.x
                } else if newPoint.x > leftViewRightBound.x {
                    newPoint.x = leftViewRightBound.x
                }
                
                // Assign the new position when we move mouse to drag it
                self.leftView.center = newPoint
            case .Ended:
                let velocity = sender.velocityInView(self.view)
                
                // detemine the new point base on velocity
                var newPoint: CGPoint
                if velocity.x > 100.0 {
                    newPoint = self.leftViewRightBound
                } else if velocity.x < -100.0 {
                    newPoint = self.leftViewLeftBound
                } else {
                    // base on the middle if velocity is low
                    if self.leftView.center.x < ((self.leftViewLeftBound.x + self.leftViewRightBound.x) / 2.0) {
                        newPoint = self.leftViewLeftBound
                    } else {
                        newPoint = self.leftViewRightBound
                    }
                }
                
                self.slideleftMenu(newPoint)
        default:
            break
        }
    }
    
//    @IBAction func onProfile(sender: AnyObject) {
//        profileUser = User.currentUser
//        performSegueWithIdentifier("tweetProfileSegue", sender: nil)
//    }
    
    
    private func slideleftMenu(newCenter: CGPoint) {
        UIView.animateWithDuration(0.3,
            delay: 0.0,
            usingSpringWithDamping: 1.0,
            initialSpringVelocity: 0.5,
            options: UIViewAnimationOptions.CurveEaseInOut,
            animations: { () -> Void in
                self.leftView.center = newCenter
            },
            completion: nil
        )
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        reloadTweets()
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: "reloadTweets", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl)
        
        
        self.leftViewLeftBound = self.leftView.center
        self.leftViewRightBound = self.leftViewLeftBound
        self.leftViewRightBound.x += 132.0

    }
    
    func reloadTweets() {
        TwitterClient.sharedInstance.homeTimeLineWithCompletion(nil, completion: { (tweets, error) -> () in
            self.tweets = tweets
            self.refreshControl.endRefreshing()
            self.tableView.reloadData()
        })
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetViewCell", forIndexPath: indexPath) as! TweetViewCell
        cell.tweet = tweets![indexPath.row]
        cell.lefView = self.leftView
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tweets != nil) {
            return tweets!.count
        } else {
            return 0
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "tweetDetailSegue" {
            let tweetDetailViewController = segue.destinationViewController as! TweetDetailViewController
            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)
            
            if let tweet = self.tweets?[indexPath!.row] {
                tweetDetailViewController.tweet = tweet
            } else {
                 // nil case
            }
        } else if segue.identifier == "tweetProfileSegue" {
            let tweetProfileViewController = segue.destinationViewController as! TweetUserProfileViewController
            tweetProfileViewController.user = User.currentUser
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
