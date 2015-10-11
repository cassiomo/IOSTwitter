//
//  StatusTableViewCell.swift
//  IOSTwitter
//
//  Created by Mo, Kevin on 10/4/15.
//  Copyright © 2015 Mo, Kevin. All rights reserved.
//

import UIKit

class StatusTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var screennameLabel: UILabel!
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    var tweet: Tweet! {
        didSet {
            nameLabel.text = tweet.text
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
