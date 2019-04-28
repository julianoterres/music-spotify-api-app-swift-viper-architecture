//
//  ArtistTracksWorker.swift
//  MusicApp
//
//  Created by Juliano Terres on 27/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Alamofire

// MARK: Methods of ArtistTracksWorkerProtocol
class ArtistTracksWorker: ArtistTracksWorkerProtocol {
  
  var urlsApi: UrlsApiProtocol?
  weak var interactor: ArtistTracksWorkerToInteractorProtocol?
  var network: NetworkProtocol?
  var auth: AuthProtocol?
  
}

// MARK: Methods of ArtistTracksInteractorToWorkerProtocol
extension ArtistTracksWorker: ArtistTracksInteractorToWorkerProtocol {
  
  func fetchTracks(artistId: String) {
    
    auth?.validateToken(success: { [weak self] in
      
      guard let url = self?.urlsApi?.topTracks(artistId: artistId) else { return }
      
      let parameters: Parameters = [
        "country": "BR"
      ]
      
      self?.network?.request(url: url, method: .get, parameters: parameters, success: { [weak self] (response) in
        do {
          let tracksResponse = try JSONDecoder().decode(ArtistApiResponse.self, from: response)
          self?.interactor?.fetchedTracks(tracksApi: tracksResponse)
        } catch let error {
          print(error)
        }
      }, failure: { (error) in
          
      })
      
    }, failure: { (error) in
        
    })
    
  }
  
}

