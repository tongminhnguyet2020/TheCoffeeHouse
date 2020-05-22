//
//  DataPopularOfCategory.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/22/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import Foundation

class SectionStyle {
    var header: Bool?
    var horizontal: Bool?
    var numColumns: Int?
    var background: String?
    var itemStyle: ItemStyle?
    init(data: [String: Any]) {
        header = data["header"] as? Bool
        horizontal = data["horizontal"] as? Bool
        numColumns = data["numColumns"] as? Int
        background = data["background"] as? String
        if let itemStyleX = data["itemStyle"] as? [String: Any]{
            self.itemStyle = ItemStyle(data: itemStyleX)
        }
    }
}
class ItemStyle {
    var type: String?
    var shadow: Bool?
    init(data: [String: Any]) {
        type = data["type"] as? String
        shadow = data["shadow"] as? Bool
    }
}
