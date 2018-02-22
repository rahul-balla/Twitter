//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var usernameText: UILabel!
    @IBOutlet weak var retweetCounter: UILabel!
    @IBOutlet weak var favoriteCounter: UILabel!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var dateCreated: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var tweet: Tweet! {
        didSet {
            tweetTextLabel.text = tweet.text
            nameText.text = tweet.user.name
             let retweetCountText = String(describing: tweet.retweetCount)
            retweetCounter.text = retweetCountText
            let favoriteCountText = String(describing: tweet.favoriteCount!)
            favoriteCounter.text = favoriteCountText
            usernameText.text = "@" + tweet.user.screenName
            dateCreated.text = tweet.createdAtString
            profileImageView.af_setImage(withURL: URL(string: tweet.profileImageURL)!)
            
            if (tweet.retweeted){
                print("wow")
                let image = UIImage(named: "retweet-icon-green")
                retweetButton.setImage(image, for: .normal)
                
            }
            else{
                let image = UIImage(named: "retweet-icon")
                retweetButton.setImage(image, for: .normal)
            }
//            
//            if(tweet.favorited)!{
//                favoriteButton.setImage(UIImage(named: "favor-icon-red"), for: .normal)
//            }
//            else{
////                let image = UIImage(named: "favor-icon-red")
////                favoriteButton.setImage(image, for: .normal)
//            }
        }
    }
    
    @IBAction func didTapRetweet(_ sender: Any) {
        
        if(tweet.retweeted){
            tweet.retweeted = !tweet.retweeted
            tweet.retweetCount -= 1
            
            retweetCounter.text = String(describing: tweet.retweetCount)
            
            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: .normal)
        }
        else{
            tweet.retweeted = !tweet.retweeted
            tweet.retweetCount += 1
            
            retweetCounter.text = String(describing: tweet.retweetCount)
            
            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: .normal)
        }
        
        
    }
    
    
    @IBAction func didTapFavorite(_ sender: Any) {
        
        if(tweet.favorited)!{
            tweet.favorited = !tweet.favorited!
            tweet.favoriteCount! -= 1
            
            favoriteCounter.text = String(describing: tweet.favoriteCount!)
            
            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
            favoriteButton.setImage(UIImage(named: "favor-icon"), for: .normal)
        }
        else{
            tweet.favorited = !tweet.favorited!
            tweet.favoriteCount! += 1
            
            favoriteCounter.text = String(describing: tweet.favoriteCount!)
            
            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
            favoriteButton.setImage(UIImage(named: "favor-icon-red"), for: .normal)
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
