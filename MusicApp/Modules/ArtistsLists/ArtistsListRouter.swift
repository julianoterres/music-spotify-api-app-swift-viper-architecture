//
//  ArtistsListRouter.swift
//  MusicApp
//
//  Created by Juliano Terres on 25/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of ArtistsListRouter
class ArtistsListRouter {
  
  var view: UIViewController?
  
}

// MARK: Methods of ArtistsListRouterProtocol
extension ArtistsListRouter: ArtistsListRouterProtocol {
  
  func buildModule() -> UIViewController {
    let view = ArtistsListView()
    let presenter = ArtistsListPresenter()
    let interactor = ArtistsListInteractor()
    let worker = ArtistsListWorker()
    let router = ArtistsListRouter()
    let network = Network()
    let urlsApi = UrlsApi()
    let auth = Auth(network: network, urlsApi: urlsApi)
    view.presenter = presenter
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

// MARK: Methods of ArtistsListPresenterToRouterProtocol
extension ArtistsListRouter: ArtistsListPresenterToRouterProtocol {
  
  func goToPlaylistScreen(artistId: String) {
    let artistDetailsView = ArtistTracksRouter().buildModule(artistId: artistId)
    view?.navigationController?.pushViewController(artistDetailsView, animated: true)
  }
  
}
