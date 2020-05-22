//
//  StateOfListStore.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/24/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import Foundation

class State {
    
    var id: Int?
    var name: String?
    var count: Int?
    var districts: [District]?
    
    init(data: [String: Any]) {
        id = data["id"] as? Int
        name = data["name"] as? String
        count = data["count"] as? Int
        if let districtArray = data["districts"] as? [[String: Any]] {
            self.districts = districtArray.compactMap({ District(data: $0)})
        }
        
    }
}

