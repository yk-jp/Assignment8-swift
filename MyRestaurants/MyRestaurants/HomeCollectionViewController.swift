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
        Food(name: "Chipotle", img: "chipotle", type: "", time: ["Lunch", "Dinner"],country: ["Mexican"], cost: 1),
        Food(name: "Pokeland", img: "pokeland", type: "Seafood", time: ["Lunch", "Dinner"], country: [""],cost: 2),
        Food(name: "CTB", img: "CTB", type: "", time: ["Breakfast", "Lunch"], country: ["American"],cost: 3),
        Food(name: "Four Seasons", img: "four seasons", type: "", time: ["Lunch", "Dinner"], country: ["Asian", "Korean"],cost: 4),
        Food(name: "Chick-fil-A", img: "chick-fil-a", type: "Fast Food", time: ["Lunch"], country: ["American"],cost: 5),
        Food(name: "Aladdins", img: "", type: "", time: ["Lunch", "Dinner"],country:["Greek","Italian"], cost: 6)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.setCollectionViewLayout(generateLayout(), animated: false)
    }
    
    
    private func generateLayout() -> UICollectionViewLayout {
        let spacing:CGFloat = 10.0
        
       let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
         item.contentInsets = NSDirectionalEdgeInsets(
            top: spacing,
            leading: spacing,
            bottom: 0,
            trailing: spacing
        )

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.38)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 2
        )
        
        group.contentInsets = NSDirectionalEdgeInsets(
            top: spacing,
            leading: spacing,
            bottom: spacing,
            trailing: spacing
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FoodCollectionViewCell
        
        let food = menuItems[indexPath.item]
        
        cell.nameLabel.text = food.name
        cell.detailsLabel.text = food.type
        
        let imgName = food.img
        cell.foodImg.image = imgName != "" ? UIImage(named: menuItems[indexPath.item].img) : UIImage(systemName: "photo")
    
        return cell
    }
    
//     default -> 1
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

}
