//
//  ArtistsListCell.swift
//  MusicApp
//
//  Created by Juliano Terres on 25/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit
import Kingfisher

// MARK: Methods of ArtistsListCell
class ArtistsListCell: UITableViewCell {
  
  let containerImage = UIView()
  let featureImage = UIImageView()
  let separator = UIView()
  let textContainer = UIView()
  let nameLabel = UILabel()
  let genresLabel = UILabel()
  let followersLabel = UILabel()
  
  static let height = CGFloat(140)
  static let identifier = "ArtistsListCell"
  var searchEntity: ArtistsEntity!
  var isLast: Bool!
  
  func setup(entity: ArtistsEntity) {
    searchEntity = entity
    setupCell()
    addElementsInScreen()
  }
  
  func setupCell() {
    selectionStyle = .none
    contentView.backgroundColor = .background
  }
  
  func addElementsInScreen() {
    addContainerImage()
    addFeatureImage()
    addTextContainer()
    addNameLabel()
    addGenresLabel()
    addSeparator()
    addFollowersLabel()
  }
  
  func addContainerImage() {
    contentView.addSubview(containerImage)
    containerImage.backgroundColor = .borderImageList
    containerImage.addConstraint(attribute: .top, alignElement: contentView, alignElementAttribute: .top, constant: 0)
    containerImage.addConstraint(attribute: .left, alignElement: contentView, alignElementAttribute: .left, constant: 20)
    containerImage.addConstraint(attribute: .bottom, alignElement: contentView, alignElementAttribute: .bottom, constant: 20)
    containerImage.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 120)
    containerImage.addConstraint(attribute: .width, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 120)
  }
  
  func addFeatureImage() {
    containerImage.addSubview(featureImage)
    featureImage.clipsToBounds = true
    featureImage.contentMode = .scaleAspectFill
    featureImage.kf.setImage(with: searchEntity.image)
    featureImage.kf.indicatorType = .activity
    featureImage.addConstraint(attribute: .top, alignElement: containerImage, alignElementAttribute: .top, constant: 5)
    featureImage.addConstraint(attribute: .left, alignElement: containerImage, alignElementAttribute: .left, constant: 5)
    featureImage.addConstraint(attribute: .right, alignElement: containerImage, alignElementAttribute: .right, constant: 5)
    featureImage.addConstraint(attribute: .bottom, alignElement: containerImage, alignElementAttribute: .bottom, constant: 5)
  }
  
  func addTextContainer() {
    contentView.addSubview(textContainer)
    textContainer.addConstraint(attribute: .left, alignElement: containerImage, alignElementAttribute: .right, constant: 20)
    textContainer.addConstraint(attribute: .right, alignElement: contentView, alignElementAttribute: .right, constant: 20)
    textContainer.addConstraint(attribute: .centerY, alignElement: containerImage, alignElementAttribute: .centerY, constant: 0)
  }
  
  func addNameLabel() {
    textContainer.addSubview(nameLabel)
    nameLabel.text = searchEntity.name.uppercased()
    nameLabel.font = .fontBold15
    nameLabel.numberOfLines = 0
    nameLabel.textColor = .white
    nameLabel.addConstraint(attribute: .top, alignElement: textContainer, alignElementAttribute: .top, constant: 0)
    nameLabel.addConstraint(attribute: .left, alignElement: textContainer, alignElementAttribute: .left, constant: 0)
    nameLabel.addConstraint(attribute: .right, alignElement: textContainer, alignElementAttribute: .right, constant: 0)
  }
  
  func addGenresLabel() {
    textContainer.addSubview(genresLabel)
    genresLabel.text = searchEntity.genres.uppercased()
    genresLabel.font = .fontRegular12
    genresLabel.numberOfLines = 0
    genresLabel.textColor = .fontGray
    genresLabel.addConstraint(attribute: .top, alignElement: nameLabel, alignElementAttribute: .bottom, constant: 0)
    genresLabel.addConstraint(attribute: .left, alignElement: textContainer, alignElementAttribute: .left, constant: 0)
    genresLabel.addConstraint(attribute: .right, alignElement: textContainer, alignElementAttribute: .right, constant: 0)
  }
  
  func addSeparator() {
    textContainer.addSubview(separator)
    separator.backgroundColor = .borderImageList
    separator.addConstraint(attribute: .top, alignElement: genresLabel, alignElementAttribute: .bottom, constant: 10)
    separator.addConstraint(attribute: .right, alignElement: textContainer, alignElementAttribute: .right, constant: 0)
    separator.addConstraint(attribute: .left, alignElement: textContainer, alignElementAttribute: .left, constant: 0)
    separator.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 2)
  }
  
  func addFollowersLabel() {
    textContainer.addSubview(followersLabel)
    followersLabel.text = searchEntity.followers
    followersLabel.font = .fontRegular12
    followersLabel.numberOfLines = 0
    followersLabel.textColor = .white
    followersLabel.addConstraint(attribute: .top, alignElement: separator, alignElementAttribute: .bottom, constant: 10)
    followersLabel.addConstraint(attribute: .left, alignElement: textContainer, alignElementAttribute: .left, constant: 0)
    followersLabel.addConstraint(attribute: .right, alignElement: textContainer, alignElementAttribute: .right, constant: 0)
    followersLabel.addConstraint(attribute: .bottom, alignElement: textContainer, alignElementAttribute: .bottom, constant: 0)
  }
  
}
