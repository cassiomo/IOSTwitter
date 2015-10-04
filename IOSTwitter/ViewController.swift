//
//  ViewController.swift
//  IOSTwitter
//
//  Created by Mo, Kevin on 10/2/15.
//  Copyright © 2015 Mo, Kevin. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLogin(sender: AnyObject) {
        
//        TwitterClient.sharedInstance.loginWithBlock() {
//            // go to next screen
//        }
        
        TwitterClient.sharedInstance.loginWithCompletion() {
            (user: User? , error: NSError?) in
            if user != nil {
                // perform segue
            } else {
                // handle login error
            }
        }
    }
}

