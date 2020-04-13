//
//  TableViewCell.swift
//  Todo
//
//  Created by Ho Duy Luong on 4/13/20.
//  Copyright © 2020 Ho Duy Luong. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    let colorArray : [UIColor] = [.black, .blue, .brown, .clear, .cyan, .darkGray, .green, .lightGray, .purple]
    @IBOutlet weak var categoryCell: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let color = colorArray.randomElement()
        categoryCell.backgroundColor = color
        categoryCell.layer.cornerRadius = categoryCell.frame.height/4
        categoryCell.text?.capitalized
        cellView.backgroundColor = color
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
