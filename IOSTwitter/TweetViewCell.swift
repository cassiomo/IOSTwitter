//
//  TweetViewCell.swift
//  IOSTwitter
//
//  Created by Mo, Kevin on 10/10/15.
//  Copyright © 2015 Mo, Kevin. All rights reserved.
//

import UIKit

class TweetViewCell: UITableViewCell {

    
    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var screenname: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profileView: UIImageView!
    
    var tweet : Tweet! {
        didSet{
            screenname.text = "@\(tweet.user!.screenname)"
            tweetText.text = tweet.text
            name.text = tweet.user?.name
            profileView.setImageWithURL(NSURL(string: (tweet.user?.profileImageUrl)!))

        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
