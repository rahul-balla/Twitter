//
//  DetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by Rahul Balla on 2/24/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailViewController: UIViewController {

    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var userScreenName: UILabel!
    @IBOutlet weak var tweetDetail: UILabel!
    @IBOutlet weak var replyImage: UIImageView!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var retweetCounter: UILabel!
    @IBOutlet weak var favorButton: UIButton!
    @IBOutlet weak var favCount: UILabel!
    @IBOutlet weak var messageButton: UIImageView!
    @IBOutlet weak var dateCreated: UILabel!
    
    var tweet: Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tweet = tweet {
            pictureImageView.af_setImage(withURL: URL(string: tweet.profileImageURL)!)
            username.text = tweet.user.name
            userScreenName.text = "@" + tweet.user.screenName
            tweetDetail.text = tweet.text
            retweetCounter.text = "\(tweet.retweetCount)"
            favCount.text = "\(tweet.favoriteCount!)"
            dateCreated.text = tweet.createdAtString
            
            if (tweet.retweeted){
                print("wow")
                let image = UIImage(named: "retweet-icon-green")
                retweetButton.setImage(image, for: .normal)
                
            }
            else{
                let image = UIImage(named: "retweet-icon")
                retweetButton.setImage(image, for: .normal)
            }
            
            if(tweet.favorited)!{
                favorButton.setImage(UIImage(named: "favor-icon-red"), for: .normal)
            }
            else{
                let image = UIImage(named: "favor-icon")
                favorButton.setImage(image, for: .normal)
            }
        }

        // Do any additional setup after loading the view.
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
            
            favCount.text = String(describing: tweet.favoriteCount!)
            
            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
            favorButton.setImage(UIImage(named: "favor-icon"), for: .normal)
        }
        else{
            tweet.favorited = !tweet.favorited!
            tweet.favoriteCount! += 1
            
            favCount.text = String(describing: tweet.favoriteCount!)
            
            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
            favorButton.setImage(UIImage(named: "favor-icon-red"), for: .normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
