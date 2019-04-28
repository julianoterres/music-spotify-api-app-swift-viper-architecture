//
//  UINavigationControllerExtension.swift
//  MusicApp
//
//  Created by Juliano Terres on 27/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

extension UINavigationController {
  
  func setup() {
    let image = UIImage(named: "arrow_left_white")
    navigationBar.backIndicatorImage = image
    navigationBar.backIndicatorTransitionMaskImage = image
    navigationBar.tintColor = .white
    navigationBar.barTintColor = .background
    navigationBar.isTranslucent = false
    navigationBar.titleTextAttributes = [
      NSAttributedString.Key.foregroundColor: UIColor.white,
      NSAttributedString.Key.font: UIFont.fontBold15
    ]
  }
  
}
