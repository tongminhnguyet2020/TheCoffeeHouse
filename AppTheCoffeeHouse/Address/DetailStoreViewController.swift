//
//  DetailStoreViewController.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/27/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class DetailStoreViewController: UIViewController {
    
    
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var mapStoreMapView: GMSMapView!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var grabButton: UIButton!
    @IBOutlet weak var goHereButton: UIButton!
    @IBOutlet weak var timeOpenLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var data: Store?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayDetailStoreCell()

        // Do any additional setup after loading the view.
    }
    
    func displayDetailStoreCell() {
        print("data\(data)")
        grabButton.layer.cornerRadius = 10
        grabButton.layer.borderColor = UIColor.green.cgColor
        grabButton.layer.borderWidth = 1
        grabButton.clipsToBounds = true
        
        goHereButton.layer.cornerRadius = 10
        goHereButton.layer.borderColor = UIColor.orange.cgColor
        goHereButton.layer.borderWidth = 1
        goHereButton.clipsToBounds = true
        
        storeImage.setupImage(imageUrl: data?.images?.last)
        streetLabel.text = data?.address?.fullAddress
        timeOpenLabel.text = (data?.openingTime ?? "") + " - " + (data?.closingTime ?? "")
        phoneLabel.text = data?.phone
        
        let camera = GMSCameraPosition.camera(withLatitude: data?.latitude ?? 0 , longitude: data?.longitude ?? 0 , zoom: 16)
        mapStoreMapView.camera = camera
                   
        let maker = GMSMarker()
        maker.position = CLLocationCoordinate2D(latitude: data?.latitude ?? 0 , longitude: data?.longitude ?? 0)
        maker.icon = UIImage(named: "ic_map_maker")
        maker.title = data?.name
        maker.snippet = data?.address?.street
        maker.map = mapStoreMapView
        
        
    }


}
