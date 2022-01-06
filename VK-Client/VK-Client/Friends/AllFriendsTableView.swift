//
//  AllFriendsTableView.swift
//  VK-Client
//
//  Created by Антон Белый on 04.12.2021.
//

import UIKit

class AllFriendsTableView: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
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
    var filteredSections = [Section]()
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        tableView.sectionHeaderTopPadding = 0
        
        let groupedDictionary = Dictionary(grouping: allFriends, by: {String($0.userName.prefix(1))})
        
        for (key, value) in groupedDictionary.sorted(by: {$0.key < $1.key}) {
            sections.append(Section(letter: key, names: value))
        }
            self.tableView.reloadData()
        
        filteredSections = sections
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return filteredSections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSections[section].names.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as! AllFriendsTableViewCell
        cell.allFriendsName.text = filteredSections[indexPath.section].names[indexPath.row].userName
        cell.allFriendsPhoto.image = UIImage(named: filteredSections[indexPath.section].names[indexPath.row].userPhoto)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        
        let letter: UILabel = UILabel(frame: CGRect(x: 30, y: 5, width: 20, height: 20))
        letter.text = filteredSections[section].letter
        letter.textColor = UIColor.black.withAlphaComponent(0.5)
        letter.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
        header.addSubview(letter)
        
        return header
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return filteredSections.map{$0.letter}
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhotos" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! FriendCollectionView
                controller.photoFriend = filteredSections[indexPath.section].names[indexPath.row].userPhoto
            }
        }
    }
}

extension AllFriendsTableView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            filteredSections = sections.filter({ friends -> Bool in
                for friend in friends.names {
                    return friend.userName.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
                }
                return false
            })
        } else {
            filteredSections = sections
        }
        tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = nil
        filteredSections = sections
        tableView.reloadData()
        searchBar.resignFirstResponder()
    }
    
}
