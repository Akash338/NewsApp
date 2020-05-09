//
//  Articles.swift
//  JsonDemo
//
//  Created by Mac on 25/04/20.
//  Copyright © 2020 Akash. All rights reserved.
//

import UIKit

struct Articles:Codable {
    
    var  author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    var content:String?
    
}

enum CodingKeys: String, CodingKey {
      case author = "author"
    case title = "title"
    case url = "url"
    case urlToImage = "urlToImage"
    case publishedAt = "publishedAt"
    case content = "content"
    case description = "description"
      
  }
