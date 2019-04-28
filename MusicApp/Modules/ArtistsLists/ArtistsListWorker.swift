//
//  ArtistsListWorker.swift
//  MusicApp
//
//  Created by Juliano Terres on 25/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Alamofire

// MARK: Methods of ArtistsListWorkerProtocol
class ArtistsListWorker: ArtistsListWorkerProtocol {
  
  var urlsApi: UrlsApiProtocol?
  weak var interactor: ArtistsListWorkerToInteractorProtocol?
  var network: NetworkProtocol?
  var auth: AuthProtocol?
  
}

// MARK: Methods of ArtistsListInteractorToWorkerProtocol
extension ArtistsListWorker: ArtistsListInteractorToWorkerProtocol {
  
  func fetchArtists(termSearch: String, offset: Int, limit: Int) {
    
    auth?.validateToken(success: { [weak self] in
      
      guard let url = self?.urlsApi?.search() else { return }
      
      let parameters: Parameters = [
        "q": termSearch,
        "type": "artist",
        "limit": String(limit),
        "offset": String(offset)
      ]
      
      self?.network?.request(url: url, method: .get, parameters: parameters, success: { [weak self] (response) in

        do {
          let searchResponse = try JSONDecoder().decode(ArtistsApiResponseEntity.self, from: response)
          self?.interactor?.fetchedArtists(artistsApi: searchResponse)
        } catch let error {
          print(error)
        }
        
      }, failure: { (error) in
        self?.interactor?.fetchedFail(error: error)
      })
      
    }, failure: {  [weak self] (error) in
      self?.interactor?.fetchedFail(error: error)
    })
    
  }
  
}
