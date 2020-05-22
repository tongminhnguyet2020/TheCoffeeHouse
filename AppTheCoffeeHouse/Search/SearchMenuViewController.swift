//
//  SearchMenuViewController.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/23/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import UIKit
import TagListView

class SearchMenuViewController: BaseViewController, TagListViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   

    @IBOutlet weak var tagView: TagListView!

    @IBOutlet weak var searchMenuCollectionView: UICollectionView!
    var datas: [Data] = []
    var searchTextField: UITextField?
    var searchData: [Data]? = []
    var dataCateg: Categ?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTagListView()
        setupCollectionView()
        // Do any additional setup after loading the view.
    }
    
    func setupNavigationBar() {
        let view = UIView(frame: CGRect(x: 22, y: 2, width: 200, height: 40))
        let searchTextField = UITextField(frame: CGRect(x: 22, y: 2, width: 200, height: 40 ))
        searchTextField.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        searchTextField.placeholder = "Tim kiem san pham"
        view.addSubview(searchTextField)
        self.searchTextField = searchTextField

        self.navigationItem.titleView = view
    }
    func setupTagListView() {
        tagView.tagBackgroundColor = UIColor.systemGroupedBackground
        tagView.textFont = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.medium)
        tagView.textColor = UIColor.black
        
        var list: [String] = []
        for data in datas {
            list.append(data.localize?.vi ?? "")
        }
        for (indexPath, title) in list.enumerated() {
            tagView.addTag(title)
            if indexPath == 10 {
                break
            }
        }
    }
    @objc func textFieldDidChange() {
        print("Total \(datas.count)")
        let searchDatas = datas.filter { data -> Bool in
            return data.localize?.vi?.uppercased().abc().contains(searchTextField?.text?.uppercased().abc() ?? "") == true
        }
        self.searchData = searchDatas
        searchMenuCollectionView.reloadData()
        tagView.superview?.isHidden = true
        print("Search result \(searchDatas.count)")
        
    }
    
    
    func setupCollectionView() {
        searchMenuCollectionView.register(cellType: CellMenuCollectionViewCell.self)
        searchMenuCollectionView.dataSource = self
        searchMenuCollectionView.delegate = self
        searchMenuCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("\(searchData?.count)")
        return searchData?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 50)/2 - 1
        return CGSize(width: width, height: width + 140)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = searchMenuCollectionView.dequeueReusableCell(cellType: CellMenuCollectionViewCell.self, indexPath: indexPath) {
            if let menuData = searchData?[indexPath.row] {
                cell.displayCell(data: menuData)
                return cell
            }
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let menuData = searchData?[indexPath.row] {
            let setupVC = SetupDrinkViewController()
            setupVC.data = menuData
            setupVC.dataCateg = dataCateg
            setupVC.modalPresentationStyle = .overFullScreen
            self.present(setupVC, animated: false, completion: nil)
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let menuData = dataMenu?.dataCateg?[indexPath.section].menuDatas[indexPath.row] {
//            let setupDrinkViewController = SetupDrinkViewController()
//            setupDrinkViewController.data = menuData
//            setupDrinkViewController.dataCateg = dataMenu
//            setupDrinkViewController.modalPresentationStyle = .overFullScreen
//            self.present(setupDrinkViewController, animated: false, completion: nil)
//
//        }
//    }
       
    
    
    
}

