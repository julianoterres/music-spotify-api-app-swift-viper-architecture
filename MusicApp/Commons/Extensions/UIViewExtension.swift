//
//  UIViewExtension.swift
//  MusicApp
//
//  Created by Juliano Terres on 25/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

extension UIView {
  
  @discardableResult func addConstraint(
    attribute: NSLayoutConstraint.Attribute,
    alignElement: Any?,
    alignElementAttribute: NSLayoutConstraint.Attribute,
    constant: CGFloat,
    typeSize: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint
  {
    self.translatesAutoresizingMaskIntoConstraints = false
    let constraint = NSLayoutConstraint(
      item: self,
      attribute: attribute,
      relatedBy: typeSize,
      toItem: alignElement,
      attribute: alignElementAttribute,
      multiplier: 1,
      constant: (attribute == .right || attribute == .bottom) ? (constant * -1) : constant
    )
    constraint.isActive = true
    return constraint
  }
  
}

