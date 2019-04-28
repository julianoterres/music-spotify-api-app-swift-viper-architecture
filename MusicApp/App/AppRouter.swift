//
//  AppRouter.swift
//  MusicApp
//
//  Created by Juliano Terres on 25/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

class AppRouter {
  
  func buildMainScreen() -> UIViewController {
    
    let auth = Auth(network: Network(), urlsApi: UrlsApi())
    
    if auth.isLogged() {
      
      let navigation = UINavigationController()
      let musicansList = ArtistsListRouter().buildModule()
      navigation.viewControllers = [musicansList]
      return navigation
      
    } else {
     
      return LoginView()
      
    }
    
  }
  
}
