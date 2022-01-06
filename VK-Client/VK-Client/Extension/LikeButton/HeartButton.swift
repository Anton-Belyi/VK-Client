//
//  HeartButton.swift
//  VK-Client
//
//  Created by Антон Белый on 06.01.2022.
//

import UIKit

protocol CountLikesDelegate: AnyObject {
    func transferCountLikes(buttonPressed: Bool)
}

class HeartButton: UIButton {
    
    weak var delegate: CountLikesDelegate?
    
    private var isLiked = false
    private let unlikedImage = UIImage(systemName: "heart")
    private let likedImage = UIImage(systemName: "heart.fill")
    private let unlikedScale: CGFloat = 0.7
    private let likedScale: CGFloat = 1.3

    override public init(frame: CGRect) {
        super.init(frame: frame)

        self.tintColor = .red
        setImage(unlikedImage, for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func flipLikedState() {
        isLiked = !isLiked
        delegate?.transferCountLikes(buttonPressed: isLiked)
        
        animate()
    }

    private func animate() {
        UIView.animate(withDuration: 0.1, animations: {
            let newImage = self.isLiked ? self.likedImage : self.unlikedImage
            let newScale = self.isLiked ? self.likedScale : self.unlikedScale
            self.transform = self.transform.scaledBy(x: newScale, y: newScale)
            self.setImage(newImage, for: .normal)
        }, completion: { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = CGAffineTransform.identity
            })
        })
    }
}
