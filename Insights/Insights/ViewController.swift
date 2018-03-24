//
//  ViewController.swift
//  Insights
//
//  Created by Vidyadhar Thatte on 3/6/18.
//  Copyright © 2018 Vidyadhar Thatte. All rights reserved.
//

import UIKit
import Parse


class ViewController: UIViewController {
    
    @IBOutlet weak var tweetTextField: UITextView!
    @IBOutlet weak var isPublicBtn: UIBarButtonItem!
    
    var isPublic : Bool = false
    

    
    @IBAction func isPublicTapped(_ sender: UIBarButtonItem) {
        if(isPublic){
            isPublic = false
            self.isPublicBtn.title = "only me"
        } else {
            isPublic = true
            self.isPublicBtn.title = "everyone"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func postTapped(_ sender: UIBarButtonItem) {
        let feed = PFObject(className:"feed")
        feed["username"] = PFUser.current()?.username
        feed["tweet"] = self.tweetTextField.text
        feed["likes"] = 0
        feed["saves"] = 0
        feed["isPublic"] = self.isPublic
        feed.saveInBackground {
            (success: Bool, error: Error?) in
            if (success) {
                // The object has been saved.
                self.dismiss(animated: true, completion: nil)
            } else {
                // There was a problem, check error.description
            }
        }

    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

