//
//  LikeViewFormButton.swift
//  VK-Client
//
//  Created by Антон Белый on 11.12.2021.
//

import UIKit

class LikeViewFormButton: UIView, CountLikesDelegate {

    private var likeCounter = UILabel()
    private var likeCount: Int = 0
    private let sizeX: Double = 58
    private let sizeY: Double = 25
    let positionX: Double
    let positionY: Double

    init(positionX: Double, positionY: Double) {
        self.positionX = positionX
        self.positionY = positionY
        super.init(frame: CGRect(x: positionX, y: positionY, width: sizeX, height: sizeY))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let likeButton = HeartButton()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        likeButton.delegate = self
        likeButton.frame = CGRect(x: 3, y: sizeY / 2 - 10, width: 20, height: 20)
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
        likeButton.addTarget(self, action: #selector(handleHeartButtonTap(_:)), for: .touchUpInside)
    }
    
    func transferCountLikes(buttonPressed: Bool) {
        if buttonPressed {
            likeCount += 1
        } else {
            likeCount -= 1
        }
        likeCounter.text = "\(likeCount)"
    }
    
    @objc private func handleHeartButtonTap(_ sender: UIButton) {
        likeButton.flipLikedState()
    }
    
}
