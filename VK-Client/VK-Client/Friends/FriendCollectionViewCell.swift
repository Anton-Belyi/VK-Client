//
//  FriendCollectionViewCell.swift
//  VK-Client
//
//  Created by Антон Белый on 04.12.2021.
//

import UIKit

class FriendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var friendPhoto: UIImageView!

    let likeButtonForm = LikeButtonForm()
                                     
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.addSubview(likeButtonForm)
        likeButtonForm.frame = CGRect(x: 10, y: contentView.frame.height - 35, width: 58, height: 25)
        likeButtonForm.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        likeButtonForm.layer.cornerRadius = likeButtonForm.frame.height / 2
        likeButtonForm.clipsToBounds = true
        
        likeButtonForm.likeButton.addTarget(self, action: #selector(handleHeartButtonTap(_:)), for: .touchUpInside)
    }
    
    @objc private func handleHeartButtonTap(_ sender: UITapGestureRecognizer? = nil) {
        likeButtonForm.flipLikedState()
    }
    
}
