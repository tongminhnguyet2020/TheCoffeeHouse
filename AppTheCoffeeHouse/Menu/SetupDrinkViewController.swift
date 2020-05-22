//
//  SetupDrinkViewController.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/22/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import UIKit

class SetupDrinkViewController: UIViewController {
    @IBOutlet weak var setupDrinkView: UIView!
    // pr
    @IBOutlet weak var prImageOfMenuImageView: UIImageView!
    @IBOutlet weak var localizeMenuLabel: UILabel!
    @IBOutlet weak var nameOfDataOfCategLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    // info
    
    @IBOutlet weak var descriptionMenuLabel: UILabel!
    //price
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var priceMenuLabel: UILabel!
    @IBOutlet weak var priceView: UIView!
    
    var data: Data!
    var dataCateg: Categ!
    
    var currentAmount = 1 {
        didSet {
            updateDisplayAmount()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displaySetupDrink()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissButtonTouchUpInside(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    func displaySetupDrink() {
        setupDrinkView.layer.cornerRadius = 15
        setupDrinkView.clipsToBounds = true
        prImageOfMenuImageView.layer.cornerRadius = 10
        prImageOfMenuImageView.clipsToBounds = true
        priceView.layer.cornerRadius = 10
        priceView.clipsToBounds = true
        minusButton.setImage(UIImage(named: "ic-minus"), for: .normal)
        minusButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        minusButton.tintColor = .gray
        addButton.setImage(UIImage(named: "ic_add"), for: .normal)
        addButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        addButton.tintColor = .orange
        
        prImageOfMenuImageView.setupImage(imageUrl: data.image)
        localizeMenuLabel.text = data.localize?.vi
        nameOfDataOfCategLabel.text = dataCateg.name
        let currencyNumber = NumberFormatter()
        currencyNumber.numberStyle = .decimal
        currencyNumber.usesGroupingSeparator = true
        let price = currencyNumber.string(for: data.price)
        priceLabel.text = (price ?? "") + "đ"
        
        descriptionMenuLabel.text = data.description
        
        updateDisplayAmount()
    }

    @IBAction func minusTouchUpSide(_ sender: Any) {
        currentAmount = max(1, currentAmount - 1)
    }
    
    
    @IBAction func addTouchUpInside(_ sender: Any) {
        currentAmount += 1
    }
    
    func updateDisplayAmount() {
        amountLabel.text = currentAmount.description
        let currencyNumber = NumberFormatter()
        currencyNumber.numberStyle = .decimal
        currencyNumber.usesGroupingSeparator = true
        let priceString = currencyNumber.string(for: currentAmount * (data.price ?? 0))
        priceMenuLabel.text = (priceString ?? "") + "đ"
    }

}
