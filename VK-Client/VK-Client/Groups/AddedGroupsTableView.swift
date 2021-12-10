//
//  AddedGroupsTableView.swift
//  VK-Client
//
//  Created by Антон Белый on 04.12.2021.
//

import UIKit

class AddedGroupsTableView: UITableViewController {
    
    var myGroups: [GroupsModel] = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.count }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addedGroupsCell", for: indexPath) as! AddedGroupsTableViewCell
        cell.addedGroupsName.text = myGroups[indexPath.row].groupName
        cell.addedGroupsImage.image = UIImage(named: myGroups[indexPath.row].groupImage)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade) }
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            guard let allGroupsController = segue.source as? NewGroupTableView else { return }
            if let indexPath = allGroupsController.tableView.indexPathForSelectedRow {
                let groups = allGroupsController.newGroup[indexPath.row]
                // Check Dublicate
                if !myGroups.contains(where: {$0 == groups}) {
                    myGroups.append(groups)
                    tableView.reloadData()
                }
            }
        }
    }
}
