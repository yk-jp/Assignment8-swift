//
//  FilterCollectionViewCell.swift
//  MyRestaurants
//
//  Created by Yusuke K on 2022-06-03.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "filterCell"
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textAlignment = .center
        return label
    }()
    
  override init(frame: CGRect) {
      super.init(frame: frame)
      
      self.addSubview(label)
      NSLayoutConstraint.activate([
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        label.widthAnchor.constraint(equalTo: self.widthAnchor)
      ])
  }
  
  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  func configureCell(_ filter: Filter) {
      label.text = filter.item
  }
}
