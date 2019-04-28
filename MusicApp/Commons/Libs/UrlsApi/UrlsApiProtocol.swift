//
//  UrlsApiProtocol.swift
//  MusicApp
//
//  Created by Juliano Terres on 25/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

protocol UrlsApiProtocol: class {
  func search() -> String
  func token() -> String
  func topTracks(artistId: String) -> String
}
