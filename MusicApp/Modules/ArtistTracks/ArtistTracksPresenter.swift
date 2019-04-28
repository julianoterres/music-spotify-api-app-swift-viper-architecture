//
//  ArtistTracksPresenter.swift
//  MusicApp
//
//  Created by Juliano Terres on 27/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of ArtistTracksPresenterProtocol
class ArtistTracksPresenter: ArtistTracksPresenterProtocol {
  
  var interactor: ArtistTracksPresenterToInteractorProtocol?
  var router: ArtistTracksRouterProtocol?
  weak var view: ArtistTracksPresenterToViewProtocol?
  
}

// MARK: Methods of ArtistTracksViewToPresenterProtocol
extension ArtistTracksPresenter: ArtistTracksViewToPresenterProtocol {
  
  func fetchTracks(artistId: String) {
    interactor?.fetchTracks(artistId: artistId)
  }
  
}

// MARK: Methods of ArtistTracksInteractorToPresentProtocol
extension ArtistTracksPresenter: ArtistTracksInteractorToPresentProtocol {
  
  func fetchedTracks(tracks: [TrackEntity]) {
    
    
    
  }
  
}

