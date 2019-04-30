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
    
//    var keey = 0
    
    let tracks = tracksApi.tracks.reversed().filter({ $0.preview_url != nil }).map { (track) -> TrackEntity in
      
      var imageUrl = PlaceholderNoImage.noImage640.rawValue
      
      if let image = track.album.images.filter({ $0.width >= 300 }).first {
        imageUrl = image.url
      }
//      var url = ""
//      if keey == 0 {
//        url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"
//      }
//
//      if keey == 1 {
//        url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3"
//      }
//
//      if keey == 2 {
//        url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3"
//      }
//
//      if keey == 3 {
//        url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3"
//      }
//
//      if keey == 4 {
//        url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3"
//      }
//
//      if keey == 5 {
//        url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3"
//      }
//
//      if keey == 6 {
//        url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3"
//      }
//
//      if keey == 7 {
//        url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3"
//      }
//
//      if keey == 8 {
//        url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3"
//      }
//
//      if keey == 9 {
//        url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3"
//      }
//      keey += 1
      
      return TrackEntity(
        duration: track.duration_ms.convertMilisecondsToPlayerTime,
        info: "Album: " + track.album.name + " Year: " + track.album.release_date,
        image: URL(string: imageUrl),
        name: track.name,
        url: URL(string: track.preview_url!)
      )
      
    }
    
    presenter?.fetchedTracks(tracks: tracks)
    
  }
  
}

