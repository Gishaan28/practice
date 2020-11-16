//
//  WeatherData.swift
//  practice
//
//  Created by Ishaan Gupta 2 on 11/14/20.
//

import UIKit

class CollectionViewCellData: UICollectionViewCell {
  let numlabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupNumLabel()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupNumLabel() {
    addSubview(numlabel)
    
    numlabel.translatesAutoresizingMaskIntoConstraints = false
    numlabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    numlabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
    numlabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
    numlabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
  }
}
