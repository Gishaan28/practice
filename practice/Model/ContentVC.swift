//
//  ContentVC.swift
//  practice
//
//  Created by Ishaan Gupta 2 on 11/16/20.
//

import UIKit

class ContentVC: UIViewController {
    
    var nameLabel =  UILabel()
    
    var pageIndex: Int = 0
    var strTitle: String!

    override func viewDidLoad() {
        super.viewDidLoad()
      setupLabel()
        nameLabel.text = strTitle
      view.backgroundColor = .cyan
    }
  
  func setupLabel() {
    view.addSubview(nameLabel)
    
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
    nameLabel.backgroundColor = .blue
  }

}
