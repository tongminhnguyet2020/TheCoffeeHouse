//
//  SettingListViewController.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/23/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import UIKit

class SettingListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var heightTableViewConstraint: NSLayoutConstraint!
    var data = [Category]()
    var didSelectCategory: ((Category) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        heightTableViewConstraint.constant = CGFloat(min(400,data.count * 50 + 70))
        // Do any additional setup after loading the view.
    }
    func setup() {
        listTableView.register(cellType: CellListTableViewCell.self)
        listTableView.dataSource = self
        listTableView.delegate = self
        listTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Danh mục món"
    }
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = listTableView.dequeueReusableCell(cellType: CellListTableViewCell.self, indexPath: indexPath) {
            cell.display(data: data[indexPath.row])
            
            
        return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.dismiss(animated: false, completion: nil)
        }
        didSelectCategory?(data[indexPath.row])
        // kiem xem no click  vao cell nao, thì scroll den cel day
        
    }
}
