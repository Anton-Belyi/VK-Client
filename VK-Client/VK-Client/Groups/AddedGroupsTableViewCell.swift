//
//  AddedGroupsTableViewCell.swift
//  VK-Client
//
//  Created by Антон Белый on 04.12.2021.
//

import UIKit

class AddedGroupsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addedGroupsName: UILabel!
    @IBOutlet weak var shadowViewAddedGroups: UIView!
    @IBOutlet weak var addedGroupsImage: UIImageView!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupShadow(view: shadowViewAddedGroups, image: addedGroupsImage)
    }
}
