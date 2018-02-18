//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import Alamofire

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var usernameText: UILabel!
    @IBOutlet weak var retweetCount: UILabel!
    @IBOutlet weak var favoriteCount: UILabel!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var dateCreated: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    var tweet: Tweet! {
        didSet {
            tweetTextLabel.text = tweet.text
            nameText.text = tweet.user.name
            let retweetCountText = String(describing: tweet.retweetCount)
            retweetCount.text = retweetCountText
            let favoriteCountText = String(describing: tweet.favoriteCount!)
            favoriteCount.text = favoriteCountText
            usernameText.text = "@" + tweet.user.screenName
            dateCreated.text = tweet.createdAtString
//            profileImageVie
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
