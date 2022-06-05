//
//  HomeCollectionViewController.swift
//  MyRestaurants
//
//  Created by Yusuke K on 2022-06-03.
//

import UIKit


class HomeCollectionViewController: UICollectionViewController {
    enum Section {
        case filter
        case menu
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    var sections = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        
        collectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: FilterCollectionViewCell.reuseIdentifier)
        collectionView.register(FoodCollectionViewCell.self, forCellWithReuseIdentifier: FoodCollectionViewCell.reuseIdentifier)
        configureDataSource()
    }
    
    private func createLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout {sectionIndex, layoutEnvironment in
            
            let section = self.sections[sectionIndex]
            
            let filterSpacing = 4.0
            let menuSpacing = 5.0
            
            switch section {
            case .filter:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: filterSpacing, bottom: 0, trailing: filterSpacing)
      
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .estimated(50))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                
                return section
                
            case .menu:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: menuSpacing, leading: menuSpacing, bottom: menuSpacing, trailing: menuSpacing)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(250))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
                group.contentInsets = NSDirectionalEdgeInsets(top: menuSpacing, leading: menuSpacing, bottom: menuSpacing, trailing: menuSpacing)
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: menuSpacing, leading: menuSpacing, bottom: menuSpacing , trailing: menuSpacing)
                
                return section
            }
        }
    }
    
    private func configureDataSource(){
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider:{
            (collectionView, indexPath, item) -> UICollectionViewCell? in
            let section = self.sections[indexPath.section]
            switch section {
            case .filter:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.reuseIdentifier, for: indexPath) as! FilterCollectionViewCell
                cell.configureCell(item.filter!)
                
                return cell
            case .menu:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCollectionViewCell.reuseIdentifier, for: indexPath) as! FoodCollectionViewCell
                cell.backgroundColor = .white
                cell.configureCell(item.food!)
                
                return cell
            }
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.filter])
        snapshot.appendItems(Item.filterItems, toSection: .filter)
        
        snapshot.appendSections([.menu])
        snapshot.appendItems(Item.menuItems, toSection: .menu)
       
        sections = snapshot.sectionIdentifiers
        
        dataSource.apply(snapshot)
    }
}
