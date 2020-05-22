//
//  TabBarViewController.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/24/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        changeLastViewController()
        // Do any additional setup after loading the view.
    }
    
    func changeLastViewController() {
        let addressViewController = AddressViewController()
        (viewControllers?[2] as? UINavigationController)?.viewControllers = [addressViewController]
    }
  

}
