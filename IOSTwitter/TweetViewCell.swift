//
//  TweetViewCell.swift
//  IOSTwitter
//
//  Created by Mo, Kevin on 10/10/15.
//  Copyright © 2015 Mo, Kevin. All rights reserved.
//

import UIKit

class TweetViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UITextView!
    
    
    var tweet : Tweet! {
        didSet{
            descriptionLabel.text = tweet.text
            nameLabel.text = "@\(tweet.user!.screenname)"
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
