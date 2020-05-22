//
//  Stores.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/24/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import Foundation
class StoreResponse {
    var count: Int?
    var listStore: [Store]?
    init(data: [String: Any]) {
        count = data["count"] as? Int
        if let storeArray = data["list_store"] as? [[String: Any]] {
            self.listStore = storeArray.compactMap({ Store(data: $0) })
        }
    }
}
