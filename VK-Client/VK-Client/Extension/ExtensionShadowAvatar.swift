//
//  ExtensionShadowAvatar.swift
//  VK-Client
//
//  Created by Антон Белый on 07.12.2021.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    func setupShadow(view: UIView, image: UIImageView) {
        view.clipsToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.8
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 5
        view.layer.shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: image.frame.height / 2).cgPath
        
        image.layer.cornerRadius = image.frame.height / 2
        image.clipsToBounds = true
    }
    
}
