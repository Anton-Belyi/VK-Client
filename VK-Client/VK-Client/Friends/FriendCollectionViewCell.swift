//
//  FriendCollectionViewCell.swift
//  VK-Client
//
//  Created by Антон Белый on 04.12.2021.
//

import UIKit

class FriendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var friendPhoto: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCount: UILabel!
    var count: Int = 0
    var likeButtonPress = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    likeButton.addTarget(self, action: #selector(handleHeartButtonTap(_:)), for: .touchUpInside)

    }

    @objc private func handleHeartButtonTap(_ sender: UIButton) {
        guard let button = sender as? LikeButton else { return }
        button.flipLikedState()

        if !likeButtonPress {
            count += 1
            likeButtonPress = true
        } else {
            count -= 1
            likeButtonPress = false
        }
        
        likeCount.text = "\(count)"
    }
}
