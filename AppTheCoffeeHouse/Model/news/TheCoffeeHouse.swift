//
//  TheCoffeeHouse.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/20/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import Foundation

class TheCoffeeHouse {
    var id: String?
    var name: String?
    var post: [Post]?
    init(data: [String: Any]) {
        id = data["id"] as? String
        name = data["name"] as? String
        if let postArray = data["posts"] as? [[String: Any]] {
            self.post = postArray.compactMap({ (Post(data: $0)) })
        }
    }
}

