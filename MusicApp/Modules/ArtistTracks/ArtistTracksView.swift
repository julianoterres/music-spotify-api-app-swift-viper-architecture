//
//  ArtistTracksView.swift
//  MusicApp
//
//  Created by Juliano Terres on 27/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit
import Kingfisher
import AVFoundation

// MARK: Methods of ArtistTracksView
class ArtistTracksView: UIViewController {
  
  let playerContainer = UIView()
  let playerImage = UIImageView()
  let playerControls = UIView()
  let tableView = UITableView()
  let timerContainer = UIView()
  let timerTotal = UILabel()
  let timerCurrent = UILabel()
  let trackTitle = UILabel()
  let buttonPrev = UIButton()
  let buttonPlay = UIButton()
  let buttonPause = UIButton()
  let buttonNext = UIButton()
  
  var presenter: ArtistTracksViewToPresenterProtocol?
  var artist: ArtistsEntity!
  var tracksEntities: [TrackEntity] = []
  var player: AVPlayer?
  var timer: Timer!
  var playActive = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    addElementsInScreen()
    presenter?.fetchTracks(artistId: artist.id)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    player = nil
  }
  
  func setupView() {
    title = artist.name
    view.backgroundColor = .background
  }
  
  func addElementsInScreen() {
    addPlayerContainer()
    addPlayerImage()
    addTimerContainer()
    addTimerTotal()
    addTimerCurrent()
    addTrackTitle()
    addPlayerControls()
    addButtonPrev()
    addButtonPlay()
    addButtonPause()
    addButtonNext()
    addTableView()
  }
  
  func addPlayerContainer() {
    view.addSubview(playerContainer)
    playerContainer.addConstraint(attribute: .top, alignElement: view.safeAreaLayoutGuide, alignElementAttribute: .top, constant: 0)
    playerContainer.addConstraint(attribute: .right, alignElement: view, alignElementAttribute: .right, constant: 0)
    playerContainer.addConstraint(attribute: .left, alignElement: view, alignElementAttribute: .left, constant: 0)
    playerContainer.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 320)
  }
  
  func addPlayerImage() {
    playerContainer.addSubview(playerImage)
    playerImage.clipsToBounds = true
    playerImage.contentMode = .scaleAspectFill
    playerImage.addConstraint(attribute: .top, alignElement: playerContainer, alignElementAttribute: .top, constant: 0)
    playerImage.addConstraint(attribute: .right, alignElement: playerContainer, alignElementAttribute: .right, constant: 0)
    playerImage.addConstraint(attribute: .left, alignElement: playerContainer, alignElementAttribute: .left, constant: 0)
  }
  
  func addTimerContainer() {
    playerContainer.addSubview(timerContainer)
    timerContainer.addConstraint(attribute: .top, alignElement: playerImage, alignElementAttribute: .bottom, constant: 20)
    timerContainer.addConstraint(attribute: .right, alignElement: playerContainer, alignElementAttribute: .right, constant: 20)
    timerContainer.addConstraint(attribute: .left, alignElement: playerContainer, alignElementAttribute: .left, constant: 20)
  }
  
  func addTimerTotal() {
    timerContainer.addSubview(timerTotal)
    timerTotal.textColor = .fontGray
    timerTotal.font = .fontRegular12
    timerTotal.addConstraint(attribute: .top, alignElement: timerContainer, alignElementAttribute: .top, constant: 0)
    timerTotal.addConstraint(attribute: .left, alignElement: timerContainer, alignElementAttribute: .left, constant: 0)
    timerTotal.addConstraint(attribute: .bottom, alignElement: timerContainer, alignElementAttribute: .bottom, constant: 0)
  }
  
  func addTimerCurrent() {
    timerContainer.addSubview(timerCurrent)
    timerCurrent.textColor = .fontGray
    timerCurrent.font = .fontRegular12
    timerCurrent.addConstraint(attribute: .top, alignElement: timerContainer, alignElementAttribute: .top, constant: 0)
    timerCurrent.addConstraint(attribute: .right, alignElement: timerContainer, alignElementAttribute: .right, constant: 0)
    timerCurrent.addConstraint(attribute: .bottom, alignElement: timerContainer, alignElementAttribute: .bottom, constant: 0)
  }
  
  func addTrackTitle() {
    playerContainer.addSubview(trackTitle)
    trackTitle.textColor = .white
    trackTitle.font = .fontBold15
    trackTitle.textAlignment = .center
    trackTitle.addConstraint(attribute: .top, alignElement: timerContainer, alignElementAttribute: .bottom, constant: 20)
    trackTitle.addConstraint(attribute: .right, alignElement: playerContainer, alignElementAttribute: .right, constant: 0)
    trackTitle.addConstraint(attribute: .left, alignElement: playerContainer, alignElementAttribute: .left, constant: 0)
  }
  
  func addPlayerControls() {
    playerContainer.addSubview(playerControls)
    playerControls.addConstraint(attribute: .top, alignElement: trackTitle, alignElementAttribute: .bottom, constant: 20)
    playerControls.addConstraint(attribute: .right, alignElement: playerContainer, alignElementAttribute: .right, constant: 0)
    playerControls.addConstraint(attribute: .left, alignElement: playerContainer, alignElementAttribute: .left, constant: 0)
    playerControls.addConstraint(attribute: .bottom, alignElement: playerContainer, alignElementAttribute: .bottom, constant: 20)
    playerControls.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 40)
  }
  
  func addButtonPrev() {
    playerControls.addSubview(buttonPrev)
    buttonPrev.setImage(UIImage(named: "icon_prev"), for: .normal)
    buttonPrev.addTarget(self, action: #selector(pressButtonPrev(button:)), for: .touchUpInside)
    buttonPrev.addConstraint(attribute: .top, alignElement: playerControls, alignElementAttribute: .top, constant: 0)
    buttonPrev.addConstraint(attribute: .bottom, alignElement: playerControls, alignElementAttribute: .bottom, constant: 0)
    buttonPrev.addConstraint(attribute: .width, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 40)
  }
  
  func addButtonPlay() {
    playerControls.addSubview(buttonPlay)
    buttonPlay.setImage(UIImage(named: "icon_play_player"), for: .normal)
    buttonPlay.addTarget(self, action: #selector(pressButtonPlay(button:)), for: .touchUpInside)
    buttonPlay.addConstraint(attribute: .top, alignElement: playerControls, alignElementAttribute: .top, constant: 0)
    buttonPlay.addConstraint(attribute: .left, alignElement: buttonPrev, alignElementAttribute: .right, constant: 20)
    buttonPlay.addConstraint(attribute: .centerX, alignElement: playerControls, alignElementAttribute: .centerX, constant: 0)
    buttonPlay.addConstraint(attribute: .bottom, alignElement: playerControls, alignElementAttribute: .bottom, constant: 0)
    buttonPlay.addConstraint(attribute: .width, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 40)
  }
  
  func addButtonPause() {
    playerControls.addSubview(buttonPause)
    buttonPause.setImage(UIImage(named: "icon_pause"), for: .normal)
    buttonPause.addTarget(self, action: #selector(pressButtonPause(button:)), for: .touchUpInside)
    buttonPause.isUserInteractionEnabled = false
    buttonPause.isHidden = true
    buttonPause.addConstraint(attribute: .centerX, alignElement: buttonPlay, alignElementAttribute: .centerX, constant: 0)
    buttonPause.addConstraint(attribute: .centerY, alignElement: buttonPlay, alignElementAttribute: .centerY, constant: 0)
    buttonPause.addConstraint(attribute: .top, alignElement: playerControls, alignElementAttribute: .top, constant: 0)
    buttonPause.addConstraint(attribute: .bottom, alignElement: playerControls, alignElementAttribute: .bottom, constant: 0)
    buttonPause.addConstraint(attribute: .width, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 40)
  }
  
  func addButtonNext() {
    playerControls.addSubview(buttonNext)
    buttonNext.setImage(UIImage(named: "icon_next"), for: .normal)
    buttonNext.addTarget(self, action: #selector(pressButtonNext(button:)), for: .touchUpInside)
    buttonNext.addConstraint(attribute: .top, alignElement: playerControls, alignElementAttribute: .top, constant: 0)
    buttonNext.addConstraint(attribute: .left, alignElement: buttonPlay, alignElementAttribute: .right, constant: 20)
    buttonNext.addConstraint(attribute: .bottom, alignElement: playerControls, alignElementAttribute: .bottom, constant: 0)
    buttonNext.addConstraint(attribute: .width, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 40)
  }
  
  func addTableView() {
    view.addSubview(tableView)
    tableView.backgroundColor = .background
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(ArtistTracksCell.self, forCellReuseIdentifier: ArtistTracksCell.identifier)
    tableView.estimatedRowHeight = ArtistTracksCell.height
    tableView.rowHeight = UITableView.automaticDimension
    tableView.separatorStyle = .none
    tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    tableView.addConstraint(attribute: .top, alignElement: playerContainer, alignElementAttribute: .bottom, constant: 0)
    tableView.addConstraint(attribute: .right, alignElement: view, alignElementAttribute: .right, constant: 0)
    tableView.addConstraint(attribute: .left, alignElement: view, alignElementAttribute: .left, constant: 0)
    tableView.addConstraint(attribute: .bottom, alignElement: view, alignElementAttribute: .bottom, constant: 0)
  }
  
  @objc func pressButtonPrev(button: UIButton) {
    presenter?.playPrevTrack()
  }
  
  @objc func pressButtonPlay(button: UIButton) {
    player?.play()
    showButtonPlay(false)
  }
  
  @objc func pressButtonPause(button: UIButton) {
    player?.pause()
    showButtonPlay(true)
  }
  
  @objc func pressButtonNext(button: UIButton) {
    presenter?.playNextTrack(totalTracks: tracksEntities.count)
  }
  
  @objc func playerUpadatCurrentTime() {
    guard let playerTrack = player else { return }
    let currentTime = Int(playerTrack.currentTime().seconds)
    timerCurrent.text = "Elapsed time " + currentTime.convertToPlayerTIme
  }
  
  func showButtonPlay(_ show: Bool) {
    buttonPause.isUserInteractionEnabled = !show
    buttonPause.isHidden = show
    buttonPlay.isUserInteractionEnabled = show
    buttonPlay.isHidden = !show
    playActive = !show
  }
  
}

// MARK: Methods of ArtistTracksPresenterToViewProtocol
extension ArtistTracksView :ArtistTracksPresenterToViewProtocol {
  
  func showTracks(tracks: [TrackEntity]) {
    tracksEntities = tracks
    setupPlayTrack(currentTrackKey: 0)
    tableView.reloadData()
  }
  
  func setupPlayTrack(currentTrackKey: Int) {
    let track = tracksEntities[currentTrackKey]
    let playerItem = AVPlayerItem(url: track.url!)
    player = AVPlayer(playerItem: playerItem)
    player?.volume = 1.0
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(playerUpadatCurrentTime), userInfo: nil, repeats: true)
    trackTitle.text = track.name
    timerTotal.text = "Track time " + track.duration
    timerCurrent.text = "Elapsed time 00:00"
    playerImage.kf.setImage(with: track.image)
    if playActive {
      player?.play()
    }
  }
  
}

// MARK: Methods of UITableViewDelegate and UITableViewDataSource
extension ArtistTracksView: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tracksEntities.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: ArtistTracksCell.identifier, for: indexPath) as? ArtistTracksCell {
      cell.setup(trackEntity: tracksEntities[indexPath.row])
      return cell
    }
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    setupPlayTrack(currentTrackKey: indexPath.row)
  }
  
}
