//
//  ArtistsApiResultEntity.swift
//  MusicApp
//
//  Created by Juliano Terres on 26/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

struct ArtistsApiResultEntity: Codable {
  let items: [ArtistsApiEntity]
  let limit: Int
  let offset: Int
  let total: Int
}
