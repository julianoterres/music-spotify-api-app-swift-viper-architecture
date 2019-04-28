//
//  LoginView.swift
//  MusicApp
//
//  Created by Juliano Terres on 27/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of LoginView
class LoginView: UIViewController {
  
  let loginContainer = UIView()
  let titleLabel = UILabel()
  let textLabel = UILabel()
  let buttonLogin = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    addElementsInScreen()
  }
  
  func setupView() {
    view.backgroundColor = .background
  }
  
  func addElementsInScreen() {
    addLoginContainer()
    addTitleLabel()
    addTextLabel()
    addButtonLogin()
  }
  
  func addLoginContainer() {
    view.addSubview(loginContainer)
    loginContainer.addConstraint(attribute: .centerX, alignElement: view, alignElementAttribute: .centerX, constant: 0)
    loginContainer.addConstraint(attribute: .centerY, alignElement: view, alignElementAttribute: .centerY, constant: 0)
  }
  
  func addTitleLabel() {
    loginContainer.addSubview(titleLabel)
    titleLabel.text = "Let's start!"
    titleLabel.textColor = .white
    titleLabel.textAlignment = .center
    titleLabel.font = .fontBold25
    titleLabel.addConstraint(attribute: .top, alignElement: loginContainer, alignElementAttribute: .top, constant: 0)
    titleLabel.addConstraint(attribute: .right, alignElement: loginContainer, alignElementAttribute: .right, constant: 0)
    titleLabel.addConstraint(attribute: .left, alignElement: loginContainer, alignElementAttribute: .left, constant: 0)
  }
  
  func addTextLabel() {
    loginContainer.addSubview(textLabel)
    textLabel.text = "For you to listen to your favorite songs you\nneed to log in with Spotify account.\n\nJust click the button below to login."
    textLabel.textColor = .fontGray
    textLabel.textAlignment = .center
    textLabel.font = .fontRegular12
    textLabel.numberOfLines = 0
    textLabel.addConstraint(attribute: .top, alignElement: titleLabel, alignElementAttribute: .bottom, constant: 10)
    textLabel.addConstraint(attribute: .right, alignElement: loginContainer, alignElementAttribute: .right, constant: 0)
    textLabel.addConstraint(attribute: .left, alignElement: loginContainer, alignElementAttribute: .left, constant: 0)
  }
  
  func addButtonLogin() {
    loginContainer.addSubview(buttonLogin)
    buttonLogin.setTitle("Login whith Spotify", for: .normal)
    buttonLogin.setTitleColor(.white, for: .normal)
    buttonLogin.titleLabel?.font = .fontBold15
    buttonLogin.backgroundColor = .greenSpotify
    buttonLogin.layer.cornerRadius = 26
    buttonLogin.addTarget(self, action: #selector(pressButton(button:)), for: .touchUpInside)
    buttonLogin.addConstraint(attribute: .top, alignElement: textLabel, alignElementAttribute: .bottom, constant: 20)
    buttonLogin.addConstraint(attribute: .centerX, alignElement: loginContainer, alignElementAttribute: .centerX, constant: 0)
    buttonLogin.addConstraint(attribute: .width, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 200)
    buttonLogin.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 52)
    buttonLogin.addConstraint(attribute: .bottom, alignElement: loginContainer, alignElementAttribute: .bottom, constant: 0)
  }
  
  @objc func pressButton(button: UIButton) {
    let authURL = URL(string: "https://accounts.spotify.com/authorize?client_id=a11c2af175c64095b4a6f2677ea96d69&response_type=code&redirect_uri=musicappspotifychallange://&Fcallback&scope=user-read-private&0user-read-email")!
    UIApplication.shared.open(authURL, options: [:], completionHandler: nil)
    buttonLogin.setTitle("Wait ...", for: .normal)
  }
  
}
