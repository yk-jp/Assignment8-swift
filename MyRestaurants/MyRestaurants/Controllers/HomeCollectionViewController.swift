//
//  HomeCollectionViewController.swift
//  MyRestaurants
//
//  Created by Yusuke K on 2022-06-03.
//

import UIKit


class HomeCollectionViewController: UICollectionViewController {
    enum Section: CaseIterable {
        case filter
        case menu
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    var filteredItemsSnapshot: NSDiffableDataSourceSnapshot<Section, Item>{
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        
        snapshot.appendSections([.filter])
        snapshot.appendSections([.menu])
        snapshot.appendItems(Item.filterItems, toSection: .filter)
        snapshot.appendItems(filteredItems, toSection: .menu)
        sections = snapshot.sectionIdentifiers
        
        return snapshot
    }
    
    var selectedFilters: Set<String> = []
    
    var sections = [Section]()
    
    var filteredItems = Item.menuItems
    
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
        
        dataSource.apply(filteredItemsSnapshot, animatingDifferences: true)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? FilterCollectionViewCell else { return }

        let filter: String = cell.label.text!
        
        if selectedFilters.contains(filter) {
            selectedFilters.remove(filter)
            cell.label.backgroundColor = .white
        } else {
            selectedFilters.insert(filter)
            cell.label.backgroundColor = UIColor.link
        }

        filteredItems = Item.menuItems.filter{(item) in
            let results = item.food?.country.filter{(c) in return selectedFilters.count == 0 || selectedFilters.contains(c)}
            return results?.count != 0
        }

         dataSource.apply(filteredItemsSnapshot, animatingDifferences: true)
    }
    
    
}
