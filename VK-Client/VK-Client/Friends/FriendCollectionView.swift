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
//        flowLayout.scrollDirection = .vertical
//        flowLayout.itemSize = CGSize(width: 150, height: 150)
//        flowLayout.minimumLineSpacing = 35.0
//        flowLayout.sectionInset = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
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
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 150, height: 150)
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//    }
}
