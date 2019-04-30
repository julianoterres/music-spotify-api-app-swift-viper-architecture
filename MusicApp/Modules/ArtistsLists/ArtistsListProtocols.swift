//
//  ArtistsListProtocols.swift
//  MusicApp
//
//  Created by Juliano Terres on 25/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of View to Presenter
protocol ArtistsListViewToPresenterProtocol: class {
  func fetchArtists(termSearch: String)
  func goToPlaylistScreen(artist: ArtistsEntity)
}

// MARK: Methods of Presenter Protocol
protocol ArtistsListPresenterProtocol: class {
  var interactor: ArtistsListPresenterToInteractorProtocol? { get set }
  var router: ArtistsListPresenterToRouterProtocol?  { get set }
  var view: ArtistsListPresenterToViewProtocol? { get set }
}

// MARK: Methods of Presenter to View
protocol ArtistsListPresenterToViewProtocol: class {
  var presenter: ArtistsListViewToPresenterProtocol? { get set }
  func showArtists(entities: [ArtistsEntity], fetchetAll: Bool)
  func notFoundResults()
  func showError(error: String)
}

// MARK: Methods of Presenter to Interactor
protocol ArtistsListPresenterToInteractorProtocol: class {
  func fetchArtists(termSearch: String)
}

// MARK: Methods of Presenter to Router
protocol ArtistsListPresenterToRouterProtocol: class {
  func goToPlaylistScreen(artist: ArtistsEntity)
}

// MARK: Methods of Interactor Protocol
protocol ArtistsListInteractorProtocol: class {
  var presenter: ArtistsListInteractorToPresentProtocol? { get set }
  var worker: ArtistsListInteractorToWorkerProtocol? { get set }
}

// MARK: Methods of Interactor to Worker
protocol ArtistsListInteractorToWorkerProtocol: class {
  func fetchArtists(termSearch: String, offset: Int, limit: Int)
}

// MARK: Methods of Interactor to Presenter
protocol ArtistsListInteractorToPresentProtocol: class {
  func fetchedArtists(entities: [ArtistsEntity], fetchetAll: Bool)
  func fetchedFail(error: String)
}

// MARK: Methods of Worker Protocol
protocol ArtistsListWorkerProtocol: class {
  var interactor: ArtistsListWorkerToInteractorProtocol? { get set }
  var network: NetworkProtocol?  { get set }
  var urlsApi: UrlsApiProtocol? { get set }
  var auth: AuthProtocol? { get set }
}

// MARK: Methods of Worker to Interactor
protocol ArtistsListWorkerToInteractorProtocol: class {
  func fetchedArtists(artistsApi: ArtistsApiResponseEntity)
  func fetchedFail(error: String)
}

// MARK: Methods of Router Protocol
protocol ArtistsListRouterProtocol: class {
  var view: UIViewController? { get set }
  func buildModule() -> UIViewController
}
