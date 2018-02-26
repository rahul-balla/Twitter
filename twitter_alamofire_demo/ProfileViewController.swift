//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Rahul Balla on 2/25/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class ProfileViewController: UIViewController {
    
    var user: User!

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var numFollowers: UILabel!
    @IBOutlet weak var numFavorites: UILabel!
    @IBOutlet weak var totalTweets: UILabel!
    @IBOutlet weak var userDesc: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIManager.shared.getCurrentAccount { (user: User?, error: Error?) in
            if user != nil {
                self.username.text = user?.name
                self.screenName.text = user?.screenName
                self.pictureImageView.af_setImage(withURL: URL(string: (user?.imageUrl)!)!)
                self.numFavorites.text = "\(user?.numFavorites ?? 0)"
                self.numFollowers.text = "\(user?.numFollowers ?? 0)"
                self.totalTweets.text = "\(user?.totalTweets ?? 0)"
                
               self.userDesc.text = "Computer Science student at Purdue"
            }
            else{
                print(error?.localizedDescription ?? "error")
            }
        }
        
        

        // Do any additional setup after loading the view.
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
