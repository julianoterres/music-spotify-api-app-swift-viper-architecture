//
//  AuthProtocol.swift
//  MusicApp
//
//  Created by Juliano Terres on 26/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

protocol AuthProtocol: class {
  func getToken(url: URL, success: @escaping () -> Void)
  func validateToken(success: @escaping () -> Void, failure: @escaping (String) -> Void)
  func isLogged() -> Bool
}
