//
//  DeviceMock.swift
//  UppyTests
//
//  Created by Arpit Williams on 07/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation
@testable import Uppy

class DeviceMock: DeviceProtocol {
  
  private let mock = "device"
  
  func model() -> String {
    return mock
  }
  
  func modelName() -> String {
    return mock
  }
  
  func systemVersion() -> String {
    return mock
  }
}
