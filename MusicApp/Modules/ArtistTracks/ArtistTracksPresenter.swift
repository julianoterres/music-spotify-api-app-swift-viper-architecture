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
  var currentTrackPlay = 0
  
}

// MARK: Methods of ArtistTracksViewToPresenterProtocol
extension ArtistTracksPresenter: ArtistTracksViewToPresenterProtocol {
  
  func fetchTracks(artistId: String) {
    interactor?.fetchTracks(artistId: artistId)
  }
  
  func playTrack(trackKey: Int) {
    currentTrackPlay = trackKey
    view?.setupPlayTrack(currentTrackKey: currentTrackPlay, autoPlay: true)
  }
  
  func playPrevTrack() {
    let prevTrack = currentTrackPlay - 1
    if prevTrack >= 0 {
      currentTrackPlay = prevTrack
      view?.setupPlayTrack(currentTrackKey: currentTrackPlay, autoPlay: true)
    }
  }
  
  func playNextTrack(totalTracks: Int) {
    let nextTrack = currentTrackPlay + 1
    if nextTrack <= (totalTracks - 1) {
      currentTrackPlay = nextTrack
      view?.setupPlayTrack(currentTrackKey: currentTrackPlay, autoPlay: true)
    }
  }
  
  func whenPlayerEnd(totalTracks: Int) {
    let nextTrack = currentTrackPlay + 1
    if nextTrack <= (totalTracks - 1) {
      currentTrackPlay = nextTrack
      view?.setupPlayTrack(currentTrackKey: currentTrackPlay, autoPlay: true)
    } else {
      view?.endPlayList()
    }
  }
  
}

// MARK: Methods of ArtistTracksInteractorToPresentProtocol
extension ArtistTracksPresenter: ArtistTracksInteractorToPresentProtocol {
  
  func fetchedTracks(tracks: [TrackEntity]) {
    if tracks.count > 0 {
      view?.showTracks(tracks: tracks)
    } else {
      view?.notFoundTracks()
    }
  }
  
}

