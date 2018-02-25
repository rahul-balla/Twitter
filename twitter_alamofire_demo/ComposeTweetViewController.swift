//
//  ComposeTweetViewController.swift
//  twitter_alamofire_demo
//
//  Created by Rahul Balla on 2/25/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

protocol ComposeTweetViewControllerDelegate: class{
    func did(post: Tweet)
}

class ComposeTweetViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var tweetButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var charCount: UILabel!
    
    weak var delegate: ComposeTweetViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetButton.layer.cornerRadius = 5
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 8
        textView.layer.backgroundColor = UIColor.white.cgColor
        
        textView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        // Set the max character limit
        let characterLimit = 140
        
        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        
        // TODO: Update Character Count Label
        if(newText.count < characterLimit + 1){
            charCount.text = "\(characterLimit - newText.count)"
        }
        
        // The new text should be allowed? True/False
        return newText.count < characterLimit
    }
    
    
    @IBAction func pressedTweet(_ sender: Any) {
        
        APIManager.shared.composeTweet(with: textView.text) { (tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Compose Tweet Success!")
            }
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
