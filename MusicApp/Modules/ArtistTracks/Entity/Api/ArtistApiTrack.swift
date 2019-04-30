//
//  ArtistApiTracks.swift
//  MusicApp
//
//  Created by Juliano Terres on 27/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

struct ArtistApiTrack: Codable {
  let album: ArtistApiTrackAlbum
  let duration_ms: Int
  let id: String
  let name: String
  let popularity: Int
  let preview_url: String?
}
