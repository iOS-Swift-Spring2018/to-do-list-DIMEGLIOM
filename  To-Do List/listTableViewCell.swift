//
//  listTableViewCell.swift
//   To-Do List
//
//  Created by Mark on 2/18/18.
//  Copyright © 2018 Mark Victor Di Meglio. All rights reserved.
//

import UIKit

class listTableViewCell: UITableViewCell {

    @IBOutlet var title: UILabel!
    @IBOutlet var note: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
