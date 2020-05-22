//
//  Image+String.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/20/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView {

    func setupImage(imageUrl: String?) {
        if let urlString = imageUrl, let url = URL(string: urlString) {
            self.kf.setImage(with: url, placeholder: UIImage(named: "empty_coupon"))
        }
    }
}
