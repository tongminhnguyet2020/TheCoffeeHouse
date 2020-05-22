//
//  PostCollectionViewCell.swift
//  AppTheCoffeeHouse
//
//  Created by Tong Minh Nguyet on 4/20/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var titlePostLabel: UILabel!
    @IBOutlet private weak var postView: UIView!
    @IBOutlet private weak var buttonOfPostButton: UIButton!
    @IBOutlet private weak var postImageView: UIImageView!
    @IBOutlet private weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func display(post: Post) {
        self.postImageView.setupImage(imageUrl: post.image)
        self.titlePostLabel.text = post.title
        self.contentLabel.text = post.content
        let titleButton = post.button
        if titleButton != nil {
            self.buttonOfPostButton.setTitle(post.button, for: UIControl.State.normal)
        } else {
            self.buttonOfPostButton.setTitle("Chi tiết", for: UIControl.State.normal)
        }
        self.layer.cornerRadius = 30
        self.clipsToBounds = true
        self.buttonOfPostButton.layer.borderColor = UIColor.orange.cgColor
        self.buttonOfPostButton.layer.borderWidth = 1
        self.buttonOfPostButton.layer.cornerRadius = 10
        self.buttonOfPostButton.clipsToBounds = true
    }
}
