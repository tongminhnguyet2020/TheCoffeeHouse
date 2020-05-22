//
//  Category.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/21/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import Foundation


class Categ {
    var name: String?
    var type: String?
    var dataCateg: [Category]?
    init(data: [String: Any]) {
        name = data["name"] as? String
        type = data["type"] as? String
        if let categArray = data["data"] as? [[String: Any]] {
            self.dataCateg = categArray.compactMap({ Category(data: $0)})
        }
    }
}
// [categ_sp, fo, dik] -> [data_sp1, sp2, sp3] -> category_id1, id2, id3
//                      ->[cf7 ngay-data,.... ] ->[(espsua-id1,....] -> lay id1 ra them vao nhom [id special] =[int]

 //                     -> [fo1, fo2, fo3, fo4, fo5] -> id1, id2, id3, id4, id5
//                      ->
class Category {
    
    var id: Int?
    var name: String?
    var branch: String?
    var image: String?
    var type: String?
    var sectionStyle: SectionStyle?
    
    var idDrink: String?
    var description: String?
    var updatedAt: DateNumberLong?
    var locale: Localize?
    var localize: Localize?
    var createdAt: DateNumberLong?
    
    // server khong tra ve, phai tu tao bang code
    var menuDatas = [Data]()
     
    init(data: [String: Any]) {
        id = data["id"] as? Int
        name = data["name"] as? String
        branch = data["branch"] as? String
        image = data["image"] as? String
        type = data["type"] as? String
        if let sectionStyleX = data["header"] as? [String: Any] {
            self.sectionStyle = SectionStyle(data: sectionStyleX)
        }
        idDrink = data["type"] as? String
        description = data["type"] as? String
        if let dateOfUpX = data["updated_at"] as? [String: Any] {
            self.updatedAt = DateNumberLong(data: dateOfUpX)
        }
        if let loca = data["locale"] as? [String: Any] {
            self.locale = Localize(data: loca)
        }
        if let loca = data["locale"] as? [String: Any] {
            self.localize = Localize(data: loca)
        }
        if let dateOfUpX = data["created_at"] as? [String: Any] {
            self.createdAt = DateNumberLong(data: dateOfUpX)
        }
        
        
        
    }
}

class DateNumberLong {
    var dateOfUp: NumberLong?
    init(data: [String: Any]) {
        if let dateOfUpX = data["$date"] as? [String: Any] {
            self.dateOfUp = NumberLong(data: dateOfUpX)
        }
    }
}
class NumberLong {
    var numberLong: String?
    init(data: [String: Any]) {
        numberLong = data["$numberLong"] as? String
    }
}
