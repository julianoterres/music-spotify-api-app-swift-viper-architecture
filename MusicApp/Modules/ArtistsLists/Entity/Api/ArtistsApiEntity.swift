//
//  ArtistsApiEntity.swift
//  MusicApp
//
//  Created by Juliano Terres on 26/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

struct ArtistsApiEntity: Codable {
  let followers: ArtistsApiFollowerstEntity
  let genres: [String]
  let id: String
  let images: [ArtistsApiImagetEntity]
  let name: String
  let popularity: Int
  let type: String
}
