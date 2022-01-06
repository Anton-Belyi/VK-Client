//
//  FriendCollectionViewCell.swift
//  VK-Client
//
//  Created by Антон Белый on 04.12.2021.
//

import UIKit

class FriendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var friendPhoto: UIImageView!

    var count: Int = 0
    var likeButtonPress = false
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let likeButton = LikeViewFormButton(positionX: 10, positionY: contentView.frame.height - 35.0)
        
        contentView.addSubview(likeButton)
        likeButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        likeButton.layer.cornerRadius = likeButton.frame.height / 2
        likeButton.clipsToBounds = true
        
    }
}
