//
//  NewGroupTableViewCell.swift
//  VK-Client
//
//  Created by Антон Белый on 04.12.2021.
//

import UIKit

class NewGroupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newGroupName: UILabel!
    @IBOutlet weak var shadowNewGroups: UIView!
    @IBOutlet weak var newGroupImage: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupShadow(view: shadowNewGroups, image: newGroupImage)
    }
}
