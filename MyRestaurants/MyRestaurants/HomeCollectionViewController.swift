//
//  HomeCollectionViewController.swift
//  MyRestaurants
//
//  Created by Yusuke K on 2022-05-31.
//

import UIKit


class HomeCollectionViewController: UICollectionViewController {
    private let reuseIdentifier = "Food"
    
    
    private let menuItems:[Food] = [
        Food(name: "Chipotle", img: "", type: "", time: ["Lunch", "Dinner"],country: ["Mexican"], cost: 1),
        Food(name: "Pokeland", img: "", type: "Seafood", time: ["Lunch", "Dinner"], country: [""],cost: 2),
        Food(name: "CTB", img: "", type: "", time: ["Breakfast", "Lunch"], country: ["American"],cost: 3),
        Food(name: "Four Seasons", img: "", type: "", time: ["Lunch", "Dinner"], country: ["Asian", "Korean"],cost: 4),
        Food(name: "Chick-fil-A", img: "", type: "Fast Food", time: ["Lunch"], country: ["American"],cost: 5),
        Food(name: "Aladdins", img: "", type: "", time: ["Lunch", "Dinner"],country:["Greek","Italian"], cost: 6)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
//    private func generateLayout() -> UICollectionViewLayout {
//       let itemSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .fractionalHeight(1.0)
//        )
//
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//        let groupSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .absolute(70.0)
//        )
//
//        let group = NSCollectionLayoutGroup.horizontal(
//            layoutSize: groupSize,
//            subitem: item,
//            count: 1
//        )
//    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FoodCollectionViewCell
        
        cell.nameLabel.text = menuItems[indexPath.item].name
    
        return cell
    }
    
//     default -> 1
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

}
