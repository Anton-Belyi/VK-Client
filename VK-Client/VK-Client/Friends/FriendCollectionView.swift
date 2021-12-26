//
//  FriendCollectionView.swift
//  VK-Client
//
//  Created by Антон Белый on 04.12.2021.
//

import UIKit

class FriendCollectionView: UICollectionViewController {
    
    var photoFriend: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendsPhotoCell", for: indexPath) as! FriendCollectionViewCell
    
        cell.friendPhoto.image = UIImage(named: photoFriend)
        
        return cell
    }
}
