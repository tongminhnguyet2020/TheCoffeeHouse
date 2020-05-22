//
//  ProductOdooOfMenu.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/21/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import Foundation

class ProductOdoo {
    
    var productTmplId: Double?
    var variants: [Variant]?
    
    init(data: [String: Any]) {
        productTmplId = data["product_tmpl_id"] as? Double
        if let variantArray = data["variants"] as? [[String: Any]] {
            self.variants = variantArray.compactMap({ Variant(data: $0) })
        }
    }
}
