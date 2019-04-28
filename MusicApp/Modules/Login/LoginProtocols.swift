//
//  LoginProtocols.swift
//  MusicApp
//
//  Created by Juliano Terres on 27/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of Router Protocol
protocol LoginRouterProtocol: class {
  var view: UIViewController? { get set }
  func buildModule() -> UIViewController
}
