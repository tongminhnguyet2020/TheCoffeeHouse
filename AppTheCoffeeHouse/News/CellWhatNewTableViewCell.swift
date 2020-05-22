//
//  CellWhatNewTableViewCell.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/20/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import UIKit

class CellWhatNewTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var postCollectionView: UICollectionView!
    var posts = [Post]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func getData(coffeeHouse: TheCoffeeHouse) {
        self.posts = coffeeHouse.post ?? []
        setupCollectionView()
       
        postCollectionView.reloadData()
    }
    
    func setupCollectionView() {
        postCollectionView.register(cellType: PostCollectionViewCell.self)
        postCollectionView.dataSource = self
        postCollectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: postCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = postCollectionView.dequeueReusableCell(cellType: PostCollectionViewCell.self, indexPath: indexPath) {
            cell.display(post: posts[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
