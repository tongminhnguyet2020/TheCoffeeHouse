//
//  AddressViewController.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/23/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps


class AddressViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var areaOnImageView: UIImageView!
    @IBOutlet weak var areaOffImageView: UIImageView!
    @IBOutlet weak var searchAreaTextField: UITextField!
    @IBOutlet weak var districtView: UIView!
    @IBOutlet weak var areaTableView: UITableView!
    @IBOutlet weak var areaCollectionView: UICollectionView!
    
    var dataListStore: ListStoreResponse?
    var stores = [Store]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        districtView.isHidden = true
        areaOffImageView.isHidden = true
        setupNavigation()
        callAPI()
        getData()
        // Do any additional setup after loading the view.
    }
    
    func callAPI() {
        callAPIStore { (listStore: ListStoreResponse) in
            self.dataListStore = listStore
            self.stores = self.dataListStore?.states?.first?.districts?.first?.stores ?? []
            self.areaCollectionView.reloadData()
        }
        areaTableView.reloadData()
    }
    func setupNavigation() {
        navigationItem.title = "Store"
    }
    
    func getData(){
        areaTableView.register(cellType: CellAreaTableViewCell.self)
        areaTableView.dataSource = self
        areaTableView.delegate = self
        areaTableView.reloadData()
        
        areaCollectionView.register(cellType: CellStoreCollectionViewCell.self)
        areaCollectionView.dataSource = self
        areaCollectionView.delegate = self
        areaCollectionView.reloadData()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print(dataListStore?.states?.count ?? 0)
        return dataListStore?.states?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataListStore?.states?[section].name
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataListStore?.states?[section].districts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = areaTableView.dequeueReusableCell(cellType: CellAreaTableViewCell.self, indexPath: indexPath) {
            if let data = dataListStore?.states?[indexPath.section] {
                cell.districtLabel.text = data.districts?[indexPath.row].name
                return cell
            }
            
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        districtView.isHidden = true
        areaOnImageView.isHidden = false
        areaOffImageView.isHidden = true
        searchAreaTextField.text = dataListStore?.states?[indexPath.section].districts?[indexPath.row].name
        
        if let district = dataListStore?.states?[indexPath.section].districts?[indexPath.row] {
            changeMapView(district: district)
        }
    }

    @IBAction func areaButtonTouchUpInside(_ sender: Any) {
        districtView.isHidden = false
        areaOnImageView.isHidden = true
        areaOffImageView.isHidden = false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stores.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: areaCollectionView.frame.height, height: areaCollectionView.frame.height )
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = areaCollectionView.dequeueReusableCell(cellType: CellStoreCollectionViewCell.self, indexPath: indexPath) {
            cell.display(data: stores[indexPath.row])
            
            return cell
        }
        return UICollectionViewCell()
    
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let lat = stores[indexPath.row].latitude, let lon = stores[indexPath.row].longitude {
            let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lon, zoom: 14)
            mapView.camera = camera
            let maker = GMSMarker()
            maker.position = CLLocationCoordinate2D(latitude: lat , longitude: lon)
            maker.title = stores[indexPath.row].name
            maker.snippet = stores[indexPath.row].address?.street
            maker.map = mapView
        }
        
        let detailStoreViewController = DetailStoreViewController()
        detailStoreViewController.data = stores[indexPath.row]
        self.navigationController?.pushViewController(detailStoreViewController, animated: true)
            
        
        
    }
    
    
    func changeMapView(district: District) {
        self.stores = district.stores ?? []
        self.areaCollectionView.reloadData()
        
        if let lat = district.stores?.first?.latitude, let lon = district.stores?.first?.longitude {
            let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lon, zoom: 14)
            mapView.camera = camera
            for store in district.stores ?? [] {
                let maker = GMSMarker()
                maker.position = CLLocationCoordinate2D(latitude: store.latitude ?? 0 , longitude: store.longitude ?? 0)
                maker.title = store.name
                maker.snippet = store.address?.street
                maker.map = mapView
            }
        }   
    }


}
