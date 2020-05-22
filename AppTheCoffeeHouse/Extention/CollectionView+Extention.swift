//
//  CollectionView+Extention.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/20/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(cellType: T.Type) {
        let nidName = String(describing: cellType)
        let cellId = UINib(nibName: nidName, bundle: nil)
        self.register(cellId, forCellWithReuseIdentifier: nidName)
    }
    func dequeueReusableCell<T: UICollectionViewCell>(cellType: T.Type, indexPath: IndexPath) -> T? {
        let nibName = String(describing: cellType)
        return self.dequeueReusableCell(withReuseIdentifier: nibName, for: indexPath) as? T 
    }
}
