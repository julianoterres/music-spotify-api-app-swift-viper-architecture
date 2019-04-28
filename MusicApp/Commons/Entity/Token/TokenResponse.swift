//
//  TokenResponse.swift
//  MusicApp
//
//  Created by Juliano Terres on 26/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

struct TokenResponse: Codable {
  let refresh_token: String?
  let scope: String
  let token_type: String
  let access_token: String
  let expires_in: Int
}
