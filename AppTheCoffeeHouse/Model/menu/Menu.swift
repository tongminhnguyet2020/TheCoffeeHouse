//
//  Menu.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/21/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import Foundation
class Menu {
    var key: String?
    var message: String?
    var data: [Data]?
    var suggesttion: [Data]?
    init(data: [String: Any]) {
        key = data["key"] as? String
        message = data["message"] as? String
        if let dataArray = data["data"] as? [[String: Any]] {
            self.data = dataArray.compactMap({ Data(data: $0) })
        }
        if let sugArray = data["suggestion"] as? [[String: Any]] {
            self.suggesttion = sugArray.compactMap({ Data(data: $0) })
        }
    }
}
