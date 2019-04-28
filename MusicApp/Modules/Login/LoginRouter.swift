//
//  LoginRouter.swift
//  MusicApp
//
//  Created by Juliano Terres on 27/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of LoginRouter
class LoginRouter {
  
  var view: UIViewController?
  
}

// MARK: Methods of LoginRouterProtocol
extension LoginRouter: LoginRouterProtocol {
  
  func buildModule() -> UIViewController {
    let view = LoginView()
    return view
  }
  
}
