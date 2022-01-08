//
//  LikeButtonForm.swift
//  VK-Client
//
//  Created by Антон Белый on 11.12.2021.
//

import UIKit

class LikeButtonForm: UIView {
    
    private let sizeX: Double = 58
    private let sizeY: Double = 25
    private var likeCounter = UILabel()
    private var likeCount: Int = 0
    private var isLiked = false
    let likeButton = UIButton()
    
    private let unlikedImage = UIImage(systemName: "heart")
    private let likedImage = UIImage(systemName: "heart.fill")
    private let unlikedScale: CGFloat = 0.7
    private let likedScale: CGFloat = 1.3
    
    override init(frame: CGRect) {
        likeButton.setImage(unlikedImage, for: .normal)
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        likeButton.frame = CGRect(x: 3, y: sizeY / 2 - 10, width: 20, height: 20)
        likeButton.tintColor = .red
        self.addSubview(likeButton)
        
        likeCounter.frame = CGRect(x: 2 + likeButton.frame.size.width + 2, y: sizeY / 2 - 10, width: 35, height: 20)
        likeCounter.text = "\(likeCount)"
        likeCounter.textColor = .red
        
        if likeCount <= 9 {
            likeCounter.textAlignment = .center
        } else {
            likeCounter.textAlignment = .left
        }
        self.addSubview(likeCounter)
    }
    
    func flipLikedState() {
        isLiked = !isLiked
        
        if isLiked {
            likeCount += 1
        } else {
            likeCount -= 1
        }
        likeCounter.text = "\(likeCount)"
        
        animate()
    }
    
    private func animate() {
        UIView.animate(withDuration: 0.1, animations: {
            let newImage = self.isLiked ? self.likedImage : self.unlikedImage
            let newScale = self.isLiked ? self.likedScale : self.unlikedScale
            self.likeButton.transform = self.likeButton.transform.scaledBy(x: newScale, y: newScale)
            self.likeButton.setImage(newImage, for: .normal)
        }, completion: { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.likeButton.transform = CGAffineTransform.identity
            })
        })
    }
    
}
