//
//  ArtistApiTrackAlbum.swift
//  MusicApp
//
//  Created by Juliano Terres on 28/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

struct ArtistApiTrackAlbum: Codable {
  let name: String
  let images: [ArtistApiTrackAlbumImage]
  let release_date: String
  let total_tracks: Int
}
