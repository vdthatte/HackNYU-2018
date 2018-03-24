//
//  FeedTableViewCell.swift
//  Insights
//
//  Created by Vidyadhar Thatte on 3/6/18.
//  Copyright © 2018 Vidyadhar Thatte. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var tweetStr: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
