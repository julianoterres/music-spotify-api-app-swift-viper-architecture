//
//  ArtistsListCellFooter.swift
//  MusicApp
//
//  Created by Juliano Terres on 28/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

class ArtistsListCellFooter: UIView {
  
  let loader = UIActivityIndicatorView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addElementsInView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    addElementsInView()
  }
  
  func addElementsInView() {
    addLoader()
  }
  
  func addLoader() {
    addSubview(loader)
    loader.startAnimating()
    loader.color = .white
    loader.addConstraint(attribute: .centerX, alignElement: self, alignElementAttribute: .centerX, constant: 0)
    loader.addConstraint(attribute: .centerY, alignElement: self, alignElementAttribute: .centerY, constant: 0)
    loader.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 20)
    loader.addConstraint(attribute: .width, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 20)
    
  }
  
}
