//
//  CellMenuCollectionViewCell.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/21/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import UIKit

class CellMenuCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet private weak var menuImageView: UIImageView!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var localizeLabel: UILabel!
    var dataMenu: Data?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func displayCell(data: Data){
        menuImageView.setupImage(imageUrl: data.image)
        localizeLabel.text = data.localize?.vi
        cellView.layer.cornerRadius = 10
        cellView.clipsToBounds = true
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .decimal
        currencyFormatter.usesGroupingSeparator = true
        let priceString = currencyFormatter.string(for: data.price)
         priceLabel.text = priceString
    }

}
