//
//  FoodCollectionViewCell.swift
//  MyRestaurants
//
//  Created by Yusuke K on 2022-06-03.
//

import UIKit

class FoodCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "foodCell"
    
//    let imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesautoresizingmaskintoconstraints = false
//        return imageView
//    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 30
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        
        return stackView
    }()
 
  override init(frame: CGRect) {
      super.init(frame: frame)
      
//      self.addSubview(imageView)
      stackView.addArrangedSubview(nameLabel)
      stackView.addArrangedSubview(detailLabel)
      addSubview(stackView)

      NSLayoutConstraint.activate([
//        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
          
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
      ])
  }
    
  required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
  }

  func configureCell(_ food: Food) {
      nameLabel.text = food.name
      detailLabel.text = food.type
  }
}
