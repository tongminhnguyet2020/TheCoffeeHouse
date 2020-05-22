//
//  CellListTableViewCell.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/23/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import UIKit

class CellListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameOfCategLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func display(data: Category?) {
        nameOfCategLabel.text = data?.name
        }
    
}
