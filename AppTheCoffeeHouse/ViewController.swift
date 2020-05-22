//
//  ViewController.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/20/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    @IBOutlet weak var newsTableView: UITableView!
    var coffeeHouses = [TheCoffeeHouse]()

    override func viewDidLoad() {
        super.viewDidLoad()
        callAPI { [weak self] (coffeeHouses) in
            self?.coffeeHouses = coffeeHouses
            self?.newsTableView?.reloadData()
        }
        setupTableView()
        newsTableView.reloadData()
        setupNavigationBar()
        
        // Do any additional setup after loading the view.
    }
    
    func setupTableView() {
        newsTableView.register(cellType: Cell0TableViewCell.self)
        newsTableView.register(cellType: CellWhatNewTableViewCell.self)
        newsTableView.dataSource = self
        newsTableView.delegate = self
    }
    func setupNavigationBar() {
        let loginView = UIView(frame: CGRect(x: 0, y: 0, width: 180, height: 44))
        loginView.backgroundColor = UIColor.clear
        let imageLogin = UIImageView(image: UIImage(named: "ic_person"))
        imageLogin.frame = CGRect(x: 5, y: 5, width: 30 , height: 30)
        let buttonLogin = UIButton(frame: CGRect(x: 45, y: 7, width: 110, height: 30))
        buttonLogin.setTitle("Đăng nhập", for: .normal)
        buttonLogin.setTitleColor(.orange, for: .normal)
        buttonLogin.layer.cornerRadius = buttonLogin.frame.height/2
        buttonLogin.layer.borderWidth = 1
        buttonLogin.layer.borderColor = UIColor.orange.cgColor
        buttonLogin.clipsToBounds = true
        loginView.addSubview(imageLogin)
        loginView.addSubview(buttonLogin)
        
        let loginBarButton = UIBarButtonItem(customView: loginView)
       
        self.navigationItem.leftBarButtonItem = loginBarButton
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return coffeeHouses.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        } else {
            return 300
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 10
        } else {
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return nil
        } else {
            let title = coffeeHouses[section - 1 ].name
            return title
        }
    }
    func setupHeaderInSection() {
        
    }

       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 && indexPath.section == 0 {
            if let cell = newsTableView.dequeueReusableCell(cellType: Cell0TableViewCell.self, indexPath: indexPath) {
                cell.membershipButtonTouchUpInside(coffeeHouses)
                cell.deliveryButtonTouchUpInside(coffeeHouses)
                cell.couponButtonTouchUpInside(coffeeHouses)
                return cell
            }
            
        } else {
            if let cell = newsTableView.dequeueReusableCell(cellType: CellWhatNewTableViewCell.self, indexPath: indexPath) {
                cell.getData(coffeeHouse: coffeeHouses[indexPath.section - 1])
                return cell
            }
        }
        return UITableViewCell()
    }
       


}

