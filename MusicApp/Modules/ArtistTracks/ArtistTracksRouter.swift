//
//  ArtistsDetailsRouter.swift
//  MusicApp
//
//  Created by Juliano Terres on 27/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of ArtistTracksRouter
class ArtistTracksRouter {
  
  var view: UIViewController?
  
}

// MARK: Methods of ArtistTracksRouterProtocol
extension ArtistTracksRouter: ArtistTracksRouterProtocol {
  
  func buildModule(artist: ArtistsEntity) -> UIViewController {
    let view = ArtistTracksView()
    let presenter = ArtistTracksPresenter()
    let interactor = ArtistTracksInteractor()
    let worker = ArtistTracksWorker()
    let router = ArtistTracksRouter()
    let network = Network()
    let urlsApi = UrlsApi()
    let auth = Auth(network: network, urlsApi: urlsApi)
    view.presenter = presenter
    view.artist = artist
    presenter.interactor = interactor
    presenter.router = router
    presenter.interactor = interactor
    presenter.view = view
    interactor.presenter = presenter
    interactor.worker = worker
    worker.urlsApi = urlsApi
    worker.interactor = interactor
    worker.network = network
    worker.auth = auth
    router.view = view
    return view
  }
  
}
