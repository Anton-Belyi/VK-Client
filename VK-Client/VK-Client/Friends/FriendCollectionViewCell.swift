//
//  FriendCollectionViewCell.swift
//  VK-Client
//
//  Created by Антон Белый on 04.12.2021.
//

import UIKit

class FriendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var friendPhoto: UIImageView!
    @IBOutlet weak var likeButton: LikeButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
     
        
        likeButton.addTarget(
            self, action: #selector(handleHeartButtonTap(_:)), for: .touchUpInside)
    
    }

    @objc private func handleHeartButtonTap(_ sender: UIButton) {
        guard let button = sender as? LikeButton else { return }
        button.flipLikedState()
      }
}
