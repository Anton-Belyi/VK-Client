//
//  AllFriendsTableView.swift
//  VK-Client
//
//  Created by Антон Белый on 04.12.2021.
//

import UIKit

class AllFriendsTableView: UITableViewController {

    var allFriends: [FriendsModel] = [
        FriendsModel(userName: "Ramsay", userPhoto: "ramsay"),
        FriendsModel(userName: "Daineris", userPhoto: "daineris"),
        FriendsModel(userName: "Night King", userPhoto: "nightKing"),
        FriendsModel(userName: "Cersey Lannister", userPhoto: "serseya"),
        FriendsModel(userName: "Jaime Lanister", userPhoto: "jaime"),
        FriendsModel(userName: "John Snow", userPhoto: "john")
    ]
    
    // Section Struct
    struct Section {
        let letter : String
        let names : [FriendsModel]
    }
    var sections = [Section]()
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.sectionHeaderTopPadding = 0
        UITableViewHeaderFooterView.appearance().tintColor = UIColor(cgColor: CGColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0))
        // Section Settings
        let groupedDictionary = Dictionary(grouping: allFriends, by: {String($0.userName.prefix(1))})
        
        for (key, value) in groupedDictionary.sorted(by: {$0.key < $1.key}) {
            sections.append(Section(letter: key, names: value))
        }
            self.tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].names.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as! AllFriendsTableViewCell
        cell.allFriendsName.text = sections[indexPath.section].names[indexPath.row].userName
        cell.allFriendsPhoto.image = UIImage(named: sections[indexPath.section].names[indexPath.row].userPhoto)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].letter
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections.map{$0.letter}
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhotos" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! FriendCollectionView
                controller.photoFriend = sections[indexPath.section].names[indexPath.row].userPhoto //objects[indexPath.row]
            }
        }
    }
    
}
