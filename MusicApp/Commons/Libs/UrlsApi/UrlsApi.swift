//
//  UrlsApi.swift
//  MusicApp
//
//  Created by Juliano Terres on 25/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

class UrlsApi: UrlsApiProtocol {
  
  private let baseUlr = "https://api.spotify.com/v1/"
  
  func search() -> String {
    return baseUlr + "search/"
  }
  
  func token() -> String {
    return "https://accounts.spotify.com/api/token"
  }
  
  func topTracks(artistId: String) -> String {
    return baseUlr + "artists/" + artistId + "/top-tracks/"
  }
  
}
