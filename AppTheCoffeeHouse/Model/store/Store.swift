//
//  Store.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/24/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import Foundation

class Store {
    
    var id: Int?
    var km: Double?
    var distance: String?
    var name: String?
    var address: Address?
    var phone: String?
    var openingTime: String?
    var closingTime: String?
    var status: String?
    var images: [String]?
    var latitude: Double?
    var longitude: Double?
      
    init(data: [String: Any]) {
        id = data["id"] as? Int
        km = data["km"] as? Double
        distance = data["km"] as? String
        name = data["name"] as? String
        if let addressX = data["address"] as? [String: Any] {
            self.address = Address(data: addressX)
        }
        phone = data["phone"] as? String
        openingTime = data["opening_time"] as? String
        closingTime = data["closing_time"] as? String
        status = data["status"] as? String
        images = data["images"] as? [String]
        if let latitude = data["latitude"] as? Double {
            self.latitude = latitude
        } else if let latitude = data["latitude"] as? String {
            self.latitude = Double(latitude)
        }
        if let longitude = data["longitude"] as? Double {
            self.longitude = longitude
        } else if let longitude = data["longitude"] as? String {
            self.longitude = Double(longitude)
        }
    }
}
