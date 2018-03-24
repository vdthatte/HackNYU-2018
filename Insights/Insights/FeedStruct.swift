//
//  FeedStruct.swift
//  Insights
//
//  Created by Vidyadhar Thatte on 3/6/18.
//  Copyright © 2018 Vidyadhar Thatte. All rights reserved.
//

import Foundation


struct Feed {
    init(str: String, username: String, likes: Int, saves: Int){
        self.string = str
        self.username = username
        self.likes = likes
        self.saves = saves
    }
    var string : String?
    var username : String?
    var likes : Int?
    var saves : Int?
}
