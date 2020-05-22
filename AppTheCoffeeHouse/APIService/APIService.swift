//
//  APIService.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/19/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import Foundation
import Alamofire



func callAPI(completion: (([TheCoffeeHouse]) -> Void)? ) {
    if let filePath = Bundle.main.url(forResource: "news", withExtension: "json") {
        if let data = try? Foundation.Data(contentsOf: filePath) {
            if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]]  {
                let coffeeHouses = json.compactMap({ TheCoffeeHouse(data: $0) })
                completion?(coffeeHouses)
            }
        }
    }
    
//    AF.request("https://api.thecoffeehouse.com/api/v3/news").responseJSON { (response) in
//        if let data = try? response.result.get() as? [[String: Any]] {
//            let coffeeHouses = data.compactMap({ TheCoffeeHouse(data: $0) })
//            print(coffeeHouses.count)
//            completion?(coffeeHouses)
//        }
//
//    }
}

func callAPIMenu(completion: ((Menu) -> Void)? ) {
    if let filePath = Bundle.main.url(forResource: "menu", withExtension: "json") {
        if let data = try? Foundation.Data(contentsOf: filePath) {
            if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                let menu = Menu(data: json)
                completion?(menu)
            }
        }
    }
    
//    AF.request("https://api.thecoffeehouse.com/api/v2/menu?lat=20.987128449039528&lng=106.21598205590224&style=1").responseJSON { (response) in
//        if let data = try? response.result.get() as? [String: Any] {
//            let menu = Menu(data: data)
//            print("\(menu)")
//            completion?(menu)
//        }
//    }
}
func callAPICategory(completion: (([Categ]) -> Void)? ) {
    if let filePath = Bundle.main.url(forResource: "category", withExtension: "json") {
        if let data = try? Foundation.Data(contentsOf: filePath) {
            if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]] {
                let categs = json.compactMap({ Categ(data: $0) })
                completion?(categs)
            }
        }
    }
}

func callAPIStore(completion: ((StoreResponse) -> Void)? ) {
    if let filePath = Bundle.main.url(forResource: "get_stores", withExtension: "json") {
        if let data = try? Foundation.Data(contentsOf: filePath) {
            if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                let storeResponse = StoreResponse(data: json)
                completion?(storeResponse)
            }
        }
    }
}

func callAPIStore(completion: ((ListStoreResponse) -> Void)? ) {
    if let filePath = Bundle.main.url(forResource: "get_list_store", withExtension: "json") {
        if let data = try? Foundation.Data(contentsOf: filePath) {
            if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                let listStoreResponse = ListStoreResponse(data: json)
                completion?(listStoreResponse)
            }
        }
    }
}
