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
  
  let iconPlay = UIImageView()
  let textContainer = UIView()
  let trackName = UILabel()
  let trackInfo = UILabel()
  let separator = UIView()
  
  static let height = CGFloat(90)
  static let identifier = "ArtistTracksCell"
  var track: TrackEntity!
  
  func setup(trackEntity: TrackEntity) {
    track = trackEntity
    setupCell()
    addElementsInScreen()
  }
  
  func setupCell() {
    selectionStyle = .none
    contentView.backgroundColor = .background
  }
  
  func addElementsInScreen() {
    addIconPlay()
    addTextContainer()
    addTrackName()
    addTrackInfo()
    addSeparator()
    addSeparator()
  }
  
  func addIconPlay() {
    contentView.addSubview(iconPlay)
    iconPlay.image = UIImage(named: "icon_play")
    iconPlay.addConstraint(attribute: .left, alignElement: contentView, alignElementAttribute: .left, constant: 20)
    iconPlay.addConstraint(attribute: .width, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 54)
    iconPlay.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 54)
  }
  
  func addTextContainer() {
    contentView.addSubview(textContainer)
    textContainer.addConstraint(attribute: .top, alignElement: contentView, alignElementAttribute: .top, constant: 20)
    textContainer.addConstraint(attribute: .right, alignElement: contentView, alignElementAttribute: .right, constant: 20)
    textContainer.addConstraint(attribute: .left, alignElement: iconPlay, alignElementAttribute: .right, constant: 20)
    textContainer.addConstraint(attribute: .bottom, alignElement: contentView, alignElementAttribute: .bottom, constant: 0)
    iconPlay.addConstraint(attribute: .centerY, alignElement: textContainer, alignElementAttribute: .centerY, constant: 0)
  }
  
  func addTrackName() {
    textContainer.addSubview(trackName)
    trackName.text = track.name
    trackName.textColor = .white
    trackName.font = .fontBold15
    trackName.addConstraint(attribute: .top, alignElement: textContainer, alignElementAttribute: .top, constant: 0)
    trackName.addConstraint(attribute: .right, alignElement: textContainer, alignElementAttribute: .right, constant: 0)
    trackName.addConstraint(attribute: .left, alignElement: textContainer, alignElementAttribute: .left, constant: 0)
  }
  
  func addTrackInfo() {
    textContainer.addSubview(trackInfo)
    trackInfo.text = track.info
    trackInfo.textColor = .fontGray
    trackInfo.font = .fontRegular12
    trackInfo.addConstraint(attribute: .top, alignElement: trackName, alignElementAttribute: .bottom, constant: 5)
    trackInfo.addConstraint(attribute: .right, alignElement: textContainer, alignElementAttribute: .right, constant: 0)
    trackInfo.addConstraint(attribute: .left, alignElement: textContainer, alignElementAttribute: .left, constant: 0)
  }
  
  func addSeparator() {
    textContainer.addSubview(separator)
    separator.backgroundColor = .fontGray
    separator.addConstraint(attribute: .top, alignElement: trackInfo, alignElementAttribute: .bottom, constant: 10)
    separator.addConstraint(attribute: .right, alignElement: textContainer, alignElementAttribute: .right, constant: 0)
    separator.addConstraint(attribute: .left, alignElement: textContainer, alignElementAttribute: .left, constant: 0)
    separator.addConstraint(attribute: .bottom, alignElement: textContainer, alignElementAttribute: .bottom, constant: 0)
    separator.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 1)
  }
  
}

