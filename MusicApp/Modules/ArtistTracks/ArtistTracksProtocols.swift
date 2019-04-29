//
//  ArtistTracksProtocols.swift
//  MusicApp
//
//  Created by Juliano Terres on 27/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of View to Presenter
protocol ArtistTracksViewToPresenterProtocol: class {
  func fetchTracks(artistId: String)
  func playPrevTrack()
  func playNextTrack(totalTracks: Int)
}

// MARK: Methods of Presenter Protocol
protocol ArtistTracksPresenterProtocol: class {
  var interactor: ArtistTracksPresenterToInteractorProtocol? { get set }
  var router: ArtistTracksRouterProtocol?  { get set }
  var view: ArtistTracksPresenterToViewProtocol? { get set }
}

// MARK: Methods of Presenter to View
protocol ArtistTracksPresenterToViewProtocol: class {
  var presenter: ArtistTracksViewToPresenterProtocol? { get set }
  func setupPlayTrack(currentTrackKey: Int)
  func showTracks(tracks: [TrackEntity])
}

// MARK: Methods of Presenter to Interactor
protocol ArtistTracksPresenterToInteractorProtocol: class {
  func fetchTracks(artistId: String)
}

// MARK: Methods of Interactor Protocol
protocol ArtistTracksInteractorProtocol: class {
  var presenter: ArtistTracksInteractorToPresentProtocol? { get set }
  var worker: ArtistTracksInteractorToWorkerProtocol? { get set }
}

// MARK: Methods of Interactor to Worker
protocol ArtistTracksInteractorToWorkerProtocol: class {
  func fetchTracks(artistId: String)
}

// MARK: Methods of Interactor to Presenter
protocol ArtistTracksInteractorToPresentProtocol: class {
  func fetchedTracks(tracks: [TrackEntity])
}

// MARK: Methods of Worker Protocol
protocol ArtistTracksWorkerProtocol: class {
  var interactor: ArtistTracksWorkerToInteractorProtocol? { get set }
  var network: NetworkProtocol?  { get set }
  var urlsApi: UrlsApiProtocol? { get set }
  var auth: AuthProtocol? { get set }
}

// MARK: Methods of Worker to Interactor
protocol ArtistTracksWorkerToInteractorProtocol: class {
  func fetchedTracks(tracksApi: ArtistApiResponse)
}

// MARK: Methods of Router Protocol
protocol ArtistTracksRouterProtocol: class {
  var view: UIViewController? { get set }
  func buildModule(artist: ArtistsEntity) -> UIViewController
}

