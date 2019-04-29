//
//  TrackEntity.swift
//  MusicApp
//
//  Created by Juliano Terres on 27/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

struct TrackEntity: Codable {
  let duration: String
  let info: String
  let image: URL?
  let name: String
  let url: URL?
}
