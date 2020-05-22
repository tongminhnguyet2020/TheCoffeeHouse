//
//  CellStoreCollectionViewCell.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/26/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import UIKit

class CellStoreCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var stateLabel: UILabel!
    @IBOutlet private weak var districtLabel: UILabel!
    @IBOutlet private weak var areaImageView: UIImageView!
    @IBOutlet private weak var cellView: UIView!
    
    private var data: Store?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func display(data: Store) {
        self.data = data
        stateLabel.text = data.address?.ward
        districtLabel.text = data.address?.street
        areaImageView.setupImage(imageUrl: data.images?.first)
        cellView.layer.cornerRadius = 6
        cellView.clipsToBounds = true
    }

}
