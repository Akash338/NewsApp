//
//  NewsFeed.swift
//  JsonDemo
//
//  Created by Mac on 25/04/20.
//  Copyright © 2020 Akash. All rights reserved.
//

import UIKit

struct NewsFeed:Codable {

    var status:String = ""
    var totalResults:Int = 0
    var articles:[Articles]?
}

