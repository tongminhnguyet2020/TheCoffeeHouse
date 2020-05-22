//
//  VariantOfMenu.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/21/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import Foundation

class Variant {
    
    var code: String?
    var price: Int?
    var productId: Int?
    var localize: Localize?
    var val: String?
    var isMain: Bool?
    
    init(data: [String: Any]) {
        code = data["code"] as? String
        price = data["price"] as? Int
        productId = data["product_id"] as? Int
        val = data["val"] as? String
        if let loca = data["localize"] as? [String: Any] {
            self.localize = Localize(data: loca)
        }
        isMain = data["is_main"] as? Bool
    }
}
