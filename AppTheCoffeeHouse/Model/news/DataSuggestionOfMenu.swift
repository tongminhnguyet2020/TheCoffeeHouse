//
//  DataOfMenu.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/21/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import Foundation
class Data {
    var id: String?
    var localize: Localize?
    var description: String?
    var productOdoo: ProductOdoo?
    var categId: [Int]?
    var toppingList: [String]?
    var varriants: [Variant]?
    var type: [String]?
    var options: [Option]?
    var codes: [String]?
    var productCategoryId: String?
    var productName: String?
    var price: Int?
    var basePrice: Int?
    var active: Bool?
    var branch: String?
    var slug: String?
    var createdAt: String?
    var updatedAt: String?
    var v: Double?
    var productVcCmp: String?
    var highResImage: String?
    var image: String?
    
    init(data: [String: Any]) {
        id = data["_id"] as? String
        if let localizeX = data["localize"] as? [String: Any] {
            self.localize = Localize(data: localizeX)
        }
        description = data["description"] as? String
        if let proto = data["product_odoo"] as? [String: Any] {
            self.productOdoo = ProductOdoo(data: proto)
        }
        categId = data["categ_id"] as? [Int]
        toppingList = data["topping_list"] as? [String]
        if let varArray = data["variants"] as? [[String: Any]] {
            self.varriants = varArray.compactMap({ Variant(data: $0) })
        }
        type = data["type"] as? [String]
        if let optionArray = data["options"] as? [[String: Any]] {
            self.options = optionArray.compactMap({ Option(data: $0)})
        }
        codes = data["codes"] as? [String]
        productCategoryId = data["product_category_id"] as? String
        productName = data["product_name"] as? String
        price = data["price"] as? Int
        basePrice = data["base_price"] as? Int
        active = data["active"] as? Bool
        branch = data["branch"] as? String
        slug = data["slug"] as? String
        createdAt = data["created_at"] as? String
        updatedAt = data["updated_at"] as? String
        v = data["__v"] as? Double
        productVcCmp = data["product_vc_cmp"] as? String
        highResImage = data["high_res_image"] as? String
        image = data["image"] as? String
    }
}



