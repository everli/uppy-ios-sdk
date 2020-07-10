//
//  GlobalConfig.swift
//  Uppy
//
//  Created by Arpit Williams on 02/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation

class GlobalConfig {

  // MARK: - Class contants

  static let shared = GlobalConfig()

  static let ErrorKey = "UppyErrorMessage"
  static let ErrorDomain = "com.uppy.network"
  static let baseUrl = Environment.current.baseUrl

  // MARK: - Instance properties

  var app: AppProtocol = App()
  var device: DeviceProtocol = Device()
  var logLevel: LogLevel = .info
}
