//
//  ArtistTracksCell.swift
//  MusicApp
//
//  Created by Juliano Terres on 27/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit
import Kingfisher

// MARK: Methods of ArtistTracksCell
class ArtistTracksCell: UITableViewCell {
  
  static let height = CGFloat(200)
  static let identifier = "ArtistTracksCell"
  
  func setup() {
    setupCell()
    addElementsInScreen()
  }
  
  func setupCell() {
    selectionStyle = .none
    contentView.backgroundColor = .black
  }
  
  func addElementsInScreen() {
    addTitleLabel()
  }
  
  func addTitleLabel() {
//    contentView.addSubview(titleLabel)
//    titleLabel.text = searchEntity.name
//    titleLabel.textColor = .white
//    titleLabel.addConstraint(attribute: .top, alignElement: featuredImage, alignElementAttribute: .bottom, constant: 20)
//    titleLabel.addConstraint(attribute: .right, alignElement: contentView, alignElementAttribute: .right, constant: 20)
//    titleLabel.addConstraint(attribute: .left, alignElement: contentView, alignElementAttribute: .left, constant: 20)
//    titleLabel.addConstraint(attribute: .bottom, alignElement: contentView, alignElementAttribute: .bottom, constant: 20)
  }
  
}

