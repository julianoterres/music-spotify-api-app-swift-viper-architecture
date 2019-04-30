//
//  AppDelegate.swift
//  MusicApp
//
//  Created by Juliano Terres on 25/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    mainScreen()
    setupAudioSpeakers()
    return true
  }
  
  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    let auth = Auth(network: Network(), urlsApi: UrlsApi())
    auth.getToken(url: url) { [weak self] in
      self?.mainScreen()
    }
    return true
  }
  
  private func mainScreen() {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = AppRouter().buildMainScreen()
    window?.makeKeyAndVisible()
  }
  
  private func setupAudioSpeakers() {
    do {
      try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
      try AVAudioSession.sharedInstance().setActive(true)
    } catch {
      print(error)
    }
  }

}

