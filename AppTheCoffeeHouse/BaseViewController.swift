//
//  BaseViewController.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/23/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backIndicatorImage =  UIImage(named: "ic-back")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "ic-back")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
