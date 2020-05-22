//
//  ListStoreResponse.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/24/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import Foundation

class ListStoreResponse {
    var states: [State]?
    
    init(data: [String: Any]) {
        if let stateArray = data["states"] as? [[String: Any]] {
            self.states = stateArray.compactMap({ State(data: $0) })
        }
    }
    
}

