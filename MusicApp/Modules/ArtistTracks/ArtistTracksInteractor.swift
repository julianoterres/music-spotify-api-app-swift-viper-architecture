//
//  ArtistTracksInteractor.swift
//  MusicApp
//
//  Created by Juliano Terres on 27/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of ArtistTracksInteractorProtocol
class ArtistTracksInteractor: ArtistTracksInteractorProtocol {
  
  weak var presenter: ArtistTracksInteractorToPresentProtocol?
  var worker: ArtistTracksInteractorToWorkerProtocol?
  
}

// MARK: Methods of ArtistTracksPresenterToInteractorProtocol
extension ArtistTracksInteractor: ArtistTracksPresenterToInteractorProtocol {
  
  func fetchTracks(artistId: String) {
    worker?.fetchTracks(artistId: artistId)
  }
  
}

// MARK: Methods of ArtistTracksWorkerToInteractorProtocol
extension ArtistTracksInteractor: ArtistTracksWorkerToInteractorProtocol {
  
  func fetchedTracks(tracksApi: ArtistApiResponse) {
    
    let tracks = tracksApi.tracks.reversed().map { (track) -> TrackEntity in
      
      return TrackEntity(
        name: track.name,
        url: URL(string: track.id)
      )
      
    }
    
    presenter?.fetchedTracks(tracks: tracks)
    
  }
  
}

