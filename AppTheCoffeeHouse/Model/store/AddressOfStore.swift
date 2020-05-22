//
//  AddressOfStore.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/24/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import Foundation

class Address {
    
    var street: String?
    var ward: String?
    var district: String?
    var state: String?
    var country: String?
    var fullAddress: String?
    
    init(data: [String: Any]) {
        street = data["street"] as? String
        ward = data["ward"] as? String
        district = data["district"] as? String
        state = data["state"] as? String
        country = data["country"] as? String
        fullAddress = data["full_address"] as? String
    }
}
