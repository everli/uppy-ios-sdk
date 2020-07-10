//
//  Environment.swift
//  Uppy
//
//  Created by Arpit Williams on 02/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation

enum Environment {

  case staging, production

  static var current: Environment {
    #if DEBUG
      return .staging
    #else
      return .production
    #endif
  }

  var baseUrl: String {
    switch self {
    case .staging:
      return "https://staging.uppy.com"
    case .production:
      return "https://uppy.com"
    }
  }
}
