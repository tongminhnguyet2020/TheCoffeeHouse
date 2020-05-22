//
//  Post.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/19/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import Foundation
class Post {
    var id: String?
    var title: String?
    var url: String?
    var image: String?
    var content: String?
    var date: String?
    var button: String?
    var deeplink: String?
    var effects: String?
    var shareUrl: String?
    init(data: [String: Any]) {
        id = data["id"] as? String
        title = data["title"] as? String
        url = data["url"] as? String
        image = data["image"] as? String
        content = data["content"] as? String
        date = data["date"] as? String
        button = data["button"] as? String
        deeplink = data["deeplink"] as? String
        effects = data["effects"] as? String
        shareUrl = data["shareUrl"] as? String
    }
}

