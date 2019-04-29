//
//  IntExtension.swift
//  MusicApp
//
//  Created by Juliano Terres on 29/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

extension Int {
  
  var convertToPlayerTIme: String {
    let currentTime = self
    let minutes = currentTime/60
    let seconds = currentTime - minutes * 60
    return String(format: "%02d:%02d", minutes,seconds) as String
  }
  
  var convertMilisecondsToPlayerTime: String {
    let seconds = (self / 1000)
    return seconds.convertToPlayerTIme
  }
  
}
