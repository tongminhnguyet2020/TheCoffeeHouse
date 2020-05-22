//
//  MenuViewController.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/21/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MenuViewController: BaseViewController {
    
    @IBOutlet private weak var containView: UIView!
    var data: Menu?
    var categs: [Categ]?

    var tabbar: ChildVCsViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callAPIMenu { (menu) in
            self.data = menu
            self.setupData()
        }
        callAPICategory { (categs) in
            self.categs = categs
            self.setupData()
        }
        setupNavigationBar()
        // Do any additional setup after loading the view.
    }
    func setupNavigationBar() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 180, height: 44))
        view.backgroundColor = .clear
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 7, width: 30, height: 30))
        imageView.image = UIImage(named: "icons_bike")
        let shipLabel = UILabel(frame: CGRect(x: 40, y: 0, width: 118, height: 22))
        shipLabel.text = "Giao hàng đến"
        shipLabel.font = UIFont.systemFont(ofSize: 13)
        let addressLabel = UILabel(frame: CGRect(x: 40, y: 21, width: 118, height: 22))
        addressLabel.text = "24 Thánh Gióng"
        addressLabel.font = UIFont.boldSystemFont(ofSize: 14)
        view.addSubview(imageView)
        view.addSubview(shipLabel)
        view.addSubview(addressLabel)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: view)
        
        let changeButton = UIButton()
        changeButton.setTitle("THAY ĐỔI", for: .normal)
        changeButton.setTitleColor(.orange, for: .normal)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: changeButton)
    }
    
    func setupData() {
        guard let menuData = data, let categs = categs else {
            return
        }
        for categ in categs {
            for category in categ.dataCateg ?? [] {
                if let categId = category.id {
                    var menuForCategory = [Data]()
                    for data in menuData.data ?? [] {
                        if data.categId?.contains(categId) == true {
                            menuForCategory.append(data)
                        }
                    }
                    category.menuDatas = menuForCategory
                }
            }
        }
        self.display()
    }
    
    func display() {
        var vcs = [UIViewController]()
        for categ in self.categs ?? [] {
            let vc = ListMenuViewController()
            vc.view.layoutIfNeeded()
            vc.setData(dataMenu: categ)
            vcs.append(vc)
        }
        tabbar = ChildVCsViewController(vcs: vcs)
        setupTabBar()
    }
    
    func setupTabBar() {
        self.addChild(tabbar)
        containView.addSubview(tabbar.view)
        tabbar.didMove(toParent: self)
    }
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabbar.view.frame = containView.bounds
    }
    
    @IBAction func searchMenuTouchUpInside(_ sender: Any) {
        let searchVC = SearchMenuViewController()
        searchVC.hidesBottomBarWhenPushed = true
        searchVC.datas = data?.data ?? []    
        searchVC.dataCateg = categs?[tabbar.currentIndex]
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
}

class ChildVCsViewController: ButtonBarPagerTabStripViewController {
    
    private var vcs = [UIViewController]()
    
    init(vcs: [UIViewController]) {
        self.vcs = vcs
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        config()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override public func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
      return vcs
    }
    
    func config() {
        settings.style.buttonBarBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = .orange
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.buttonBarItemFont = UIFont.systemFont(ofSize: 20)
        settings.style.selectedBarHeight = 3

        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .red
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        buttonBarView?.backgroundColor = .white

        self.changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?,
                progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            oldCell?.label.textColor = UIColor.lightGray
            newCell?.label.textColor = UIColor.black
        }
    }
    
}

