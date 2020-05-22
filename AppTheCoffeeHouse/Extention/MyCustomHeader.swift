//
//  File.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/20/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import Foundation
import UIKit

class MyCustomHeader: UITableViewHeaderFooterView {
    let title = UILabel()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        title.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(title)
        NSLayoutConstraint.activate([
            // Center the label vertically, and use it to fill the remaining
            // space in the header view.
            title.heightAnchor.constraint(equalToConstant: 30),
            title.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            title.trailingAnchor.constraint(equalTo:
                   contentView.layoutMarginsGuide.trailingAnchor),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}


//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if section == 0 {
//            return UIView()
//        } else {
//            if let header = newsTableView.dequeueReusableHeaderFooterView(withIdentifier: "MyCustomHeader") as? MyCustomHeader {
//                header.title.text = coffeeHouses[section + 1].name
//                return header
//            }
//        }
//        return UIView()
//    }
//   
