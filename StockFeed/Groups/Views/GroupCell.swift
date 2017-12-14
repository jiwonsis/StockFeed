//
//  GroupCell.swift
//  StockFeed
//
//  Created by Scott moon on 13/12/2017.
//  Copyright © 2017 Scott moon. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    class func cellForHeight() -> CGFloat {
        return 82
    }
    
    func configureGroupCell(group: Group) {
        titleLabel.text = group.title
        noteLabel.text = group.note
    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
