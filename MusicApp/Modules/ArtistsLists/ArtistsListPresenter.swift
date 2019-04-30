//
//  ArtistsListPresenter.swift
//  MusicApp
//
//  Created by Juliano Terres on 25/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of ArtistsListPresenter
class ArtistsListPresenter: ArtistsListPresenterProtocol {
  
  var interactor: ArtistsListPresenterToInteractorProtocol?
  var router: ArtistsListPresenterToRouterProtocol?
  weak var view: ArtistsListPresenterToViewProtocol?
  
}

// MARK: Methods of ArtistsListViewToPresenterProtocol
extension ArtistsListPresenter: ArtistsListViewToPresenterProtocol {
  
  func fetchArtists(termSearch: String) {
    interactor?.fetchArtists(termSearch: termSearch)
  }
  
  func goToPlaylistScreen(artist: ArtistsEntity) {
    router?.goToPlaylistScreen(artist: artist)
  }
  
}

// MARK: Methods of ArtistsListInteractorToPresentProtocol
extension ArtistsListPresenter: ArtistsListInteractorToPresentProtocol {
  
  func fetchedArtists(entities: [ArtistsEntity], fetchetAll: Bool) {
    if entities.count > 0 {
      view?.showArtists(entities: entities, fetchetAll: fetchetAll)
    } else {
      view?.notFoundResults()
    }
  }
  
  func fetchedFail(error: String) {
    view?.showError(error: error)
  }

}
