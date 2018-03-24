//
//  MyNotesViewController.swift
//  Insights
//
//  Created by Vidyadhar Thatte on 3/6/18.
//  Copyright © 2018 Vidyadhar Thatte. All rights reserved.
//

import UIKit
import Parse

class MyNotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var feedList : [Feed] = []
    
    @IBOutlet weak var myNotesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        feedList = []
        
        let query = PFQuery(className:"feed")
        query.order(byDescending: "createdAt")
        //query.whereKey("playerName", equalTo:"Sean Plott")
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
                    self.myNotesTable.reloadData()
                }
            } else {
                // Log details of the failure
                print("Error: \(error!)")
            }
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.feedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "my-notes-cell", for: indexPath) as! MyNotesTableViewCell
        cell.notesLabel.text = self.feedList[indexPath.row].string
        cell.usernameLabel.text = self.feedList[indexPath.row].username
        cell.likesLabel.text = "\(self.feedList[indexPath.row].likes!)"
        return cell
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
