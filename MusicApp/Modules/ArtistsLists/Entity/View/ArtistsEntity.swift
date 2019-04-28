//
//  ArtistsEntity.swift
//  MusicApp
//
//  Created by Juliano Terres on 26/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

struct ArtistsEntity: Codable {
  let id: String
  let image: URL?
  let name: String
  let followers: String
  let genres: String
}
