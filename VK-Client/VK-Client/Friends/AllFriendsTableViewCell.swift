//
//  AllFriendsTableViewCell.swift
//  VK-Client
//
//  Created by Антон Белый on 04.12.2021.
//

import UIKit

class AllFriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var allFriendsName: UILabel!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var allFriendsPhoto: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupShadow(view: shadowView, image: allFriendsPhoto)

    }
}
