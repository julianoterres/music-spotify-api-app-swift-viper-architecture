//
//  NetworkProtocol.swift
//  MusicApp
//
//  Created by Juliano Terres on 25/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Alamofire

protocol NetworkProtocol: class {
  func request(url: String, method: HTTPMethod, parameters: Parameters?, success: @escaping (Data) -> Void, failure: @escaping (String) -> Void)
  func requestToken(url: String, code: String, type: TokenRequestType, success: @escaping (Data) -> Void, failure: @escaping (String) -> Void)
}
