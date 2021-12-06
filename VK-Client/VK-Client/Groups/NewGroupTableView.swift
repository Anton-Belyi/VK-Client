//
//  NewGroupTableView.swift
//  VK-Client
//
//  Created by Антон Белый on 04.12.2021.
//

import UIKit

class NewGroupTableView: UITableViewController {
    
    var newGroup: [GroupsModel] = [
        GroupsModel(groupName: "Apple", groupImage: "apple"),
        GroupsModel(groupName: "Google", groupImage: "google"),
        GroupsModel(groupName: "Yandex", groupImage: "yandex")
    ]
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newGroup.count }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newGroupCell", for: indexPath) as! NewGroupTableViewCell
        cell.newGroupName.text = newGroup[indexPath.row].groupName
        cell.newGroupImage.image = UIImage(named: newGroup[indexPath.row].groupImage)
        return cell
    }
}




    
