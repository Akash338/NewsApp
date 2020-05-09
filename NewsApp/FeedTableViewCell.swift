//
//  FeedTableViewCell.swift
//  NewsApp
//
//  Created by Mac on 01/05/20.
//  Copyright © 2020 Akash. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblone: UILabel!
    @IBOutlet weak var lbltwo: UILabel!
    @IBOutlet weak var Img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
