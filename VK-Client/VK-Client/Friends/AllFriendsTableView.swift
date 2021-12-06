//
//  AllFriendsTableView.swift
//  VK-Client
//
//  Created by Антон Белый on 04.12.2021.
//

import UIKit

class AllFriendsTableView: UITableViewController {
    
    let allFriends: [FriendsModel] = [
        FriendsModel(userName: "Ramsay", userPhoto: "ramsay"),
        FriendsModel(userName: "Daineris", userPhoto: "daineris"),
        FriendsModel(userName: "Night King", userPhoto: "nightKing"),
        FriendsModel(userName: "Serseya", userPhoto: "serseya")
        
    ]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allFriends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as! AllFriendsTableViewCell
        cell.allFriendsName.text = allFriends[indexPath.row].userName
        cell.allFriendsPhoto.image = UIImage(named: allFriends[indexPath.row].userPhoto)
        return cell
    }
}
