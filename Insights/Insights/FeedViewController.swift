//
//  FeedViewController.swift
//  Insights
//
//  Created by Vidyadhar Thatte on 3/6/18.
//  Copyright © 2018 Vidyadhar Thatte. All rights reserved.
//

import UIKit
import Parse

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var feedList : [Feed] = []
    
    @IBOutlet weak var feedTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        feedList = []
        
        
        if(PFUser.current() != nil){
            let query = PFQuery(className:"feed")
            query.order(byDescending: "createdAt")
            query.whereKey("isPublic", equalTo:true)
            query.findObjectsInBackground {
                (objects: [PFObject]?, error: Error?) -> Void in
                
                if error == nil {
                    // The find succeeded.
                    print("Successfully retrieved \(objects!.count) scores.")
                    // Do something with the found objects
                    if let objects = objects {
                        for object in objects {
                            let feedObj = Feed(str: object["tweet"] as! String, username: object["username"] as! String, likes: object["likes"] as! Int, saves: object["saves"] as! Int)
                            self.feedList.append(feedObj)
                        }
                        self.feedTable.reloadData()
                    }
                } else {
                    // Log details of the failure
                    print("Error: \(error!)")
                }
            }
        } else {
            // present login
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "login-screen") as! LoginViewController
            self.present(vc, animated: true, completion: nil)
            
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.feedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedTableViewCell
        cell.tweetStr.text = self.feedList[indexPath.row].string
        cell.likesLabel.text = "\(self.feedList[indexPath.row].likes!)"
        cell.username.text = self.feedList[indexPath.row].username
        return cell
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    
}
