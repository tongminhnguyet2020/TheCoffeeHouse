//
//  ListMenuViewController.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/21/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import UIKit
import XLPagerTabStrip



class ListMenuViewController: UIViewController, IndicatorInfoProvider, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    var dataMenu: Categ?
    var datas = [Data]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionview()
        // Do any additional setup after loading the view.
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: dataMenu?.name ?? "")
    }
    
    func setData(dataMenu: Categ) {
        self.dataMenu = dataMenu
        menuCollectionView.reloadData()
    }
    
    
    func setupCollectionview() {
        menuCollectionView.register(cellType: CellMenuCollectionViewCell.self)
        menuCollectionView.register(UINib(nibName: "ListMenuHeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
           return dataMenu?.dataCateg?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if dataMenu?.dataCateg?[section].menuDatas.count != 0 {
            return CGSize(width: collectionView.frame.width, height: 44)
        } else {
            return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? ListMenuHeaderCollectionReusableView
            header?.display(dataMenu?.dataCateg?[indexPath.section].name)
            return header ?? UICollectionReusableView()
        }
        return UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataMenu?.dataCateg?[section].menuDatas.count ?? 0
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 50)/2 - 1
        return CGSize(width: width, height: width + 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(cellType: CellMenuCollectionViewCell.self, indexPath: indexPath) {
            if let data = dataMenu?.dataCateg?[indexPath.section].menuDatas[indexPath.row] {
                cell.displayCell(data: data )
            }
            return cell
        }
        return  UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let menuData = dataMenu?.dataCateg?[indexPath.section].menuDatas[indexPath.row] {
            let setupDrinkViewController = SetupDrinkViewController()
            setupDrinkViewController.data = menuData
            setupDrinkViewController.dataCateg = dataMenu
            setupDrinkViewController.modalPresentationStyle = .overFullScreen
            self.present(setupDrinkViewController, animated: false, completion: nil)
            
        }
    }
    
    @IBAction func settingListButtonTouchUpInside(_ sender: Any) {
        let settingListViewController = SettingListViewController()
        settingListViewController.didSelectCategory = { [weak self] (category: Category) in
            print("Da chon thang \(category.name)")
            self?.scrollTo(category: category)
        }
        settingListViewController.data = dataMenu?.dataCateg ?? []
        settingListViewController.modalPresentationStyle = .overFullScreen
        self.present(settingListViewController, animated: false, completion: nil)
    }
    
    func scrollTo(category: Category) {
        if let index = dataMenu?.dataCateg?.firstIndex(where: { $0.id == category.id }) {
            let attributes = self.menuCollectionView.collectionViewLayout.layoutAttributesForSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, at: IndexPath(item: 0, section: index))
            
            menuCollectionView.setContentOffset(CGPoint(x: 0, y: attributes!.frame.origin.y), animated: true)
        }
    }
}
