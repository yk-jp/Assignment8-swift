//
//  FilterCollectionViewCell.swift
//  MyRestaurants
//
//  Created by Yusuke K on 2022-06-03.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "filterCell"
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitleColor(UIColor.link, for: .normal)
        button.layer.cornerRadius = 5
        
        return button
    }()
 
  override init(frame: CGRect) {
      super.init(frame: frame)
      
      self.addSubview(button)
      NSLayoutConstraint.activate([
        button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        button.widthAnchor.constraint(equalTo: self.widthAnchor)
      ])
  }
  
  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  func configureCell(_ filter: Filter) {
      button.setTitle(filter.item, for: .normal)
  }
}
