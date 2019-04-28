//
//  ArtistsListView.swift
//  MusicApp
//
//  Created by Juliano Terres on 25/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of ArtistsListView
class ArtistsListView: UIViewController {
  
  let searchBar = UISearchBar()
  let tableView = UITableView(frame: .zero, style: .grouped)
  let loader = UIActivityIndicatorView()
  let alertContainer = UIView()
  let alertImage = UIImageView()
  let alertTitle = UILabel()
  let alertText = UILabel()
  
  var presenter: ArtistsListViewToPresenterProtocol?
  var artistsEntities: [ArtistsEntity] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    addElementsInScreen()
    setupAlertBeginSearch()
    hideKeyboardWhenTappedAround()
  }
  
  func setupView() {
    title = "Artists List"
    view.backgroundColor = .background
    navigationController?.setup()
    setupBackButton()
    //presenter?.fetchArtists(termSearch: "Bob")
  }
  
  func addElementsInScreen() {
    addSearchBar()
    addLoader()
    addTableView()
    addAlertContainer()
    addAlertImage()
    addAlertTitle()
    addAlertText()
  }
  
  func addSearchBar() {
    view.addSubview(searchBar)
    searchBar.backgroundImage = UIImage()
    searchBar.delegate = self
    searchBar.placeholder = "Enter artist name"
    searchBar.setupFont()
    searchBar.addConstraint(attribute: .top, alignElement: view.safeAreaLayoutGuide, alignElementAttribute: .top, constant: 0)
    searchBar.addConstraint(attribute: .right, alignElement: view, alignElementAttribute: .right, constant: 17)
    searchBar.addConstraint(attribute: .left, alignElement: view, alignElementAttribute: .left, constant: 17)
    searchBar.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 44)
  }
  
  func addTableView() {
    view.addSubview(tableView)
    tableView.backgroundColor = .background
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(ArtistsListCell.self, forCellReuseIdentifier: ArtistsListCell.identifier)
    tableView.estimatedRowHeight = ArtistsListCell.height
    tableView.rowHeight = UITableView.automaticDimension
    tableView.separatorStyle = .none
    tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    tableView.isHidden = true
    tableView.isUserInteractionEnabled = false
    tableView.addConstraint(attribute: .top, alignElement: searchBar, alignElementAttribute: .bottom, constant: 0)
    tableView.addConstraint(attribute: .right, alignElement: view, alignElementAttribute: .right, constant: 0)
    tableView.addConstraint(attribute: .left, alignElement: view, alignElementAttribute: .left, constant: 0)
    tableView.addConstraint(attribute: .bottom, alignElement: view, alignElementAttribute: .bottom, constant: 0)
    loader.addConstraint(attribute: .centerX, alignElement: tableView, alignElementAttribute: .centerX, constant: 0)
    loader.addConstraint(attribute: .centerY, alignElement: tableView, alignElementAttribute: .centerY, constant: 0)
  }
  
  func addLoader() {
    view.addSubview(loader)
    loader.color = .white
    loader.startAnimating()
    loader.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 20)
    loader.addConstraint(attribute: .width, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 20)
  }
  
  func addAlertContainer() {
    view.addSubview(alertContainer)
    alertContainer.backgroundColor = .background
    alertContainer.isUserInteractionEnabled = false
    alertContainer.addConstraint(attribute: .centerX, alignElement: tableView, alignElementAttribute: .centerX, constant: 0)
    alertContainer.addConstraint(attribute: .centerY, alignElement: tableView, alignElementAttribute: .centerY, constant: 0)
  }
  
  func addAlertImage() {
    alertContainer.addSubview(alertImage)
    alertImage.clipsToBounds = true
    alertImage.contentMode = .scaleAspectFill
    alertImage.addConstraint(attribute: .top, alignElement: alertContainer, alignElementAttribute: .top, constant: 0)
    alertImage.addConstraint(attribute: .centerX, alignElement: alertContainer, alignElementAttribute: .centerX, constant: 0)
    alertImage.addConstraint(attribute: .width, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 50)
    alertImage.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 50)
  }
  
  func addAlertTitle() {
    alertContainer.addSubview(alertTitle)
    alertTitle.numberOfLines = 0
    alertTitle.textColor = .white
    alertTitle.font = .fontBold15
    alertTitle.textAlignment = .center
    alertTitle.addConstraint(attribute: .top, alignElement: alertImage, alignElementAttribute: .bottom, constant: 10)
    alertTitle.addConstraint(attribute: .right, alignElement: alertContainer, alignElementAttribute: .right, constant: 0)
    alertTitle.addConstraint(attribute: .left, alignElement: alertContainer, alignElementAttribute: .left, constant: 0)
    
  }
  
  func addAlertText() {
    alertContainer.addSubview(alertText)
    alertText.textColor = .fontGray
    alertText.font = .fontRegular12
    alertText.numberOfLines = 0
    alertText.textAlignment = .center
    alertText.addConstraint(attribute: .top, alignElement: alertTitle, alignElementAttribute: .bottom, constant: 10)
    alertText.addConstraint(attribute: .right, alignElement: alertContainer, alignElementAttribute: .right, constant: 0)
    alertText.addConstraint(attribute: .left, alignElement: alertContainer, alignElementAttribute: .left, constant: 0)
    alertText.addConstraint(attribute: .bottom, alignElement: alertContainer, alignElementAttribute: .bottom, constant: 0)
  }
  
  func setupAlertBeginSearch() {
    alertImage.image = UIImage(named: "icon_search")
    alertTitle.text = "Search for your favorite artists"
    alertText.text = "Type the name of the artist you want to search\nin the search field above."
  }
  
  func setupAlertNoFoundResults() {
    alertImage.image = UIImage(named: "icon_warning")
    alertTitle.text = "Could not find \"" + searchBar.text! + "\""
    alertText.text = "Please try again by typing the search term another\nway or by using another keyword."
  }
  
  func setupAlertError(error: String) {
    alertImage.image = UIImage(named: "icon_warning")
    alertTitle.text = "Ops! An error has occurred"
    alertText.text = "There were some errors processing\nyour request, please try again.\n\n Error: " + error
  }
  
}

// MARK: Methods of ArtistsListPresenterToViewProtocol
extension ArtistsListView: ArtistsListPresenterToViewProtocol {
  
  func showArtists(entities: [ArtistsEntity]) {
    artistsEntities = entities
    tableView.reloadData()
    alertContainer.isHidden = true
    tableView.isHidden = false
  }
  
  func notFoundResults() {
    setupAlertNoFoundResults()
    tableView.isHidden = true
    alertContainer.isHidden = false
  }
  
  func showError(error: String) {
    setupAlertError(error: error)
    tableView.isHidden = true
    alertContainer.isHidden = false
  }
  
}

// MARK: Methods of UITableViewDelegate and UITableViewDataSource
extension ArtistsListView: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return artistsEntities.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: ArtistsListCell.identifier, for: indexPath) as? ArtistsListCell {
      cell.setup(entity: artistsEntities[indexPath.row])
      return cell
    }
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let artistId = artistsEntities[indexPath.row].id
    presenter?.goToPlaylistScreen(artistId: artistId)
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 44
  }
  
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return ArtistsListCellFooter()
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if scrollView.contentOffset.y > (scrollView.contentSize.height - (scrollView.frame.size.height + ArtistsListCell.height)) {
      guard let text = searchBar.text else { return }
      presenter?.fetchArtists(termSearch: text)
    }
  }
  
}

// MARK: Methods of UISearchBarDelegate
extension ArtistsListView: UISearchBarDelegate {
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let text = searchBar.text else { return }
    dismissKeyboard()
    tableView.isHidden = true
    alertContainer.isHidden = true
    tableView.contentOffset = .zero
    presenter?.fetchArtists(termSearch: text)
  }
  
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    tableView.isUserInteractionEnabled = false
  }
  
  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    tableView.isUserInteractionEnabled = true
  }
  
}

