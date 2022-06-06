//
//  FoodCollectionViewCell.swift
//  MyRestaurants
//
//  Created by Yusuke K on 2022-06-03.
//

import UIKit

class FoodCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "foodCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var titleStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel,priceLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 5
        return stack
    }()
    
    lazy var descriptionStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleStackView, detailLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 0
        return stack
    }()
    
  override init(frame: CGRect) {
      super.init(frame: frame)

      addSubview(imageView)
      addSubview(descriptionStackView)
      
      NSLayoutConstraint.activate([
        imageView.topAnchor.constraint(equalTo: self.topAnchor),
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
        titleStackView.widthAnchor.constraint(equalTo: descriptionStackView.widthAnchor),
        descriptionStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
        descriptionStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        descriptionStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        descriptionStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
      ])
  }
    
  required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
  }

  func configureCell(_ food: Food) {
      if food.img == "" {
          imageView.image = UIImage(systemName: "photo")
      } else {
          imageView.image = UIImage(named: food.img)
      }

      nameLabel.text = food.name
      priceLabel.text = "\(food.cost) $"
      detailLabel.text = formatDetailLabel(food: food)
  }
    
    private func formatDetailLabel(food: Food) -> String {
        return "\(food.country.joined(separator: ",")), \(food.type), (\(food.time.joined(separator: ",")))".trimmingLeadingAndTrailingSpaces()
    }
}
