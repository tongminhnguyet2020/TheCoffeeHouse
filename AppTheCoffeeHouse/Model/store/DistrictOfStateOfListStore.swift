//
//  DistricyOfStateOfListStore.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/24/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import Foundation

class District { 
    
    var id: Int?
    var name: String?
    var count: Int?
    var stateName: String?
    var stores: [Store]?
    
    init(data: [String: Any]) {
        id = data["id"] as? Int
        name = data["name"] as? String
        count = data["count"] as? Int
        stateName = data["state_name"] as? String
        if let storeArray = data["stores"] as? [[String: Any]] {
            self.stores = storeArray.compactMap({ Store(data: $0) })
        }

    }
}
