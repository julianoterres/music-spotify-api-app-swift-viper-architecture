//
//  ArtistTracksView.swift
//  MusicApp
//
//  Created by Juliano Terres on 27/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of ArtistsDetailsView
class ArtistTracksView: UIViewController {
  
  var presenter: ArtistTracksViewToPresenterProtocol?
  var artistId: String!
  var tracksEntities: [TrackEntity] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    addElementsInScreen()
    presenter?.fetchTracks(artistId: artistId)
    
  }
  
  func setupView() {
    title = "Artist Tracks"
    view.backgroundColor = .background
  }
  
  func addElementsInScreen() {
    
  }
  
  func addSearchBar() {
    
  }
  
}

// MARK: Methods of ArtistTracksPresenterToViewProtocol
extension ArtistTracksView :ArtistTracksPresenterToViewProtocol {
  
  func showTracks(tracks: [TrackEntity]) {
    
    tracksEntities = tracks
    
  }
  
}
