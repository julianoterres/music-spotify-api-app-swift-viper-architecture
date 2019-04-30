//
//  ArtistsListInteractor.swift
//  MusicApp
//
//  Created by Juliano Terres on 25/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of ArtistsListInteractor
class ArtistsListInteractor: ArtistsListInteractorProtocol {
  
  weak var presenter: ArtistsListInteractorToPresentProtocol?
  var worker: ArtistsListInteractorToWorkerProtocol?
  var artistsSaved: [ArtistsEntity] = []
  var termSearchSaved = ""
  var totalArtists = 0
  let limit = 20
  var offset = 0
  var loadingActive = false
  
}

// MARK: Methods of ArtistsListPresenterToInteractorProtocol
extension ArtistsListInteractor: ArtistsListPresenterToInteractorProtocol {
  
  func fetchArtists(termSearch: String) {
    
    if termSearchSaved != termSearch {
      termSearchSaved = termSearch
      offset = 0
      totalArtists = 0
      artistsSaved.removeAll()
    }
    
    if loadingActive == false && termSearch.isEmpty == false && (artistsSaved.count < totalArtists || totalArtists == 0) {
      loadingActive = true
      worker?.fetchArtists(termSearch: termSearch, offset: offset, limit: limit)
      offset += limit
    }
    
  }
  
}

// MARK: Methods of ArtistsListWorkerToInteractorProtocol
extension ArtistsListInteractor: ArtistsListWorkerToInteractorProtocol {
  
  func fetchedArtists(artistsApi: ArtistsApiResponseEntity) {
  
    let artists = artistsApi.artists.items.map { (artist) -> ArtistsEntity in
      
      var imageUrl = PlaceholderNoImage.noImage640.rawValue
      
      if let image = artist.images.filter({ $0.width >= 300 }).first {
        imageUrl = image.url
      }
      
      var genres = "Uncategorized"
        
      if let genreFirst = artist.genres.first {
        genres = genreFirst
      }
      
      return ArtistsEntity(
        id: artist.id,
        image: URL(string: imageUrl),
        name: artist.name,
        followers: String(artist.followers.total) + " followers",
        genres: genres
      )
      
    }
    
    artistsSaved.append(contentsOf: artists)
    loadingActive = false
    totalArtists = artistsApi.artists.total
    let fetchetAll = artistsSaved.count >= totalArtists
    presenter?.fetchedArtists(entities: artistsSaved, fetchetAll: fetchetAll)
    
  }
  
  func fetchedFail(error: String) {
    loadingActive = false
    presenter?.fetchedFail(error: error)
  }
  
}
