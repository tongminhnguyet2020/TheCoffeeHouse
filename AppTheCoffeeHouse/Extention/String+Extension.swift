//
//  String+Extension.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/24/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import Foundation

extension String {
    func abc()->String {
        var x = self.replacingOccurrences(of: "đ", with: "d")
        x = self.replacingOccurrences(of: "Đ", with: "D")
        let data = x.data(using: String.Encoding.ascii, allowLossyConversion: true)
        x = String(data: data!, encoding: String.Encoding.ascii) ?? ""
        return x
    }
}
