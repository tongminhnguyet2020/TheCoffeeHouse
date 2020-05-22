//
//  LocalizeOfMenu.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/21/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import Foundation

class Localize {
    
    var en: String?
    var vi: String?
    
    init(data: [String: Any]) {
        en = data["en"] as? String
        vi = data["vi"] as? String
    }
}
