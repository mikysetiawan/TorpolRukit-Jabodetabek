//
//  TableViewCell.swift
//  TorpolRukit Jabodetabek
//
//  Created by Miky Setiawan on 19/04/20.
//  Copyright © 2020 Miky Technology. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var photoList: UIImageView!
    @IBOutlet weak var titleList: UILabel!
    @IBOutlet weak var descList: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
