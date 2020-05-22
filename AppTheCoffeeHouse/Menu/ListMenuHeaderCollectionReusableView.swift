//
//  ListMenuHeaderCollectionReusableView.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/22/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import UIKit

class ListMenuHeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var headerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func display(_ title: String?) {
        headerLabel.text = title
    }
}
