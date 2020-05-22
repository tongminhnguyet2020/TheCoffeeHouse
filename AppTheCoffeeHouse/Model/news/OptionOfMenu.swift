//
//  OptionOfMenu.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/21/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import Foundation
class Option {
    
    var name: String?
    var description: String?
    var min: Double?
    var max: Double?
    var defaultIndex: Double?
    var items: [Variant]?
    
    init(data: [String: Any]) {
        name = data["name"] as? String
        description = data["description"] as? String
        min = data["min"] as? Double
        max = data["max"] as? Double
        defaultIndex = data["default_index"] as? Double
        if let itemArray = data["items"] as? [[String: Any]] {
            self.items = itemArray.compactMap({ Variant(data: $0) })
        }
    }
}

