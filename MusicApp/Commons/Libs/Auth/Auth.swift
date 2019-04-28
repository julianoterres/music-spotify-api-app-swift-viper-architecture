//
//  Auth.swift
//  MusicApp
//
//  Created by Juliano Terres on 26/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Alamofire

class Auth: AuthProtocol {
  
  let network: NetworkProtocol
  let urlsApi: UrlsApiProtocol
  
  init(network: NetworkProtocol, urlsApi: UrlsApiProtocol) {
    self.network = network
    self.urlsApi = urlsApi
  }
  
  func getToken(url: URL, success: @escaping () -> Void) {
    
    let code = url.absoluteString.replacingOccurrences(of: "musicappspotifychallange://?code=", with: "")
    
    network.requestToken(url: urlsApi.token(), code: code, type: .new, success: { (response) in
      
      do {
        let tokenResponse = try JSONDecoder().decode(TokenResponse.self, from: response)
        self.saveToken(tokenResponse: tokenResponse)
        success()
      } catch let error {
        print(error)
      }
      
    }, failure: { (error) in
      print("Failed get token")
    })
    
  }
  
  func validateToken(success: @escaping () -> Void, failure: @escaping (String) -> Void) {
    
    guard
      let tokenRefresh = UserDefaults.standard.object(forKey: "tokenRefresh") as? String,
      let tokenExpire = UserDefaults.standard.object(forKey: "tokenExpire") as? Date else {
      failure("Failed to get tokenRefresh")
      return
    }
    
    if tokenExpire > Date() {
      success()
      return
    }
    
    network.requestToken(url: urlsApi.token(), code: tokenRefresh, type: .refresh, success: { (response) in
      
      do {
        let tokenResponse = try JSONDecoder().decode(TokenResponse.self, from: response)
        self.saveToken(tokenResponse: tokenResponse)
        success()
      } catch let error {
        failure(error.localizedDescription)
      }
      
    }, failure: { (error) in
      failure(error)
    })
    
  }
  
  func isLogged() -> Bool {
    
    guard
      UserDefaults.standard.object(forKey: "token") != nil,
      UserDefaults.standard.object(forKey: "tokenRefresh") != nil,
      UserDefaults.standard.object(forKey: "tokenExpire") != nil else {
        return false
    }
    
    return true
    
  }
  
  private func saveToken(tokenResponse: TokenResponse) {
    
    let token = tokenResponse.token_type + " " + tokenResponse.access_token
    let dateExpire = Calendar.current.date(byAdding: .second, value: tokenResponse.expires_in, to: Date())
    UserDefaults.standard.set(token, forKey: "token")
    UserDefaults.standard.set(dateExpire, forKey: "tokenExpire")
    if let tokenRefresh = tokenResponse.refresh_token {
      UserDefaults.standard.set(tokenRefresh, forKey: "tokenRefresh")
    }
    
  }
  
}
