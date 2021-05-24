//
//  Device.swift
//  Uppy
//
//  Created by Arpit Williams on 02/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation
import UIKit

protocol DeviceProtocol {
  func model() -> String
  func modelName() -> String
  func systemVersion() -> String
}

struct Device: DeviceProtocol {

  func model() -> String {
    return UIDevice.current.model
  }

  func modelName() -> String {
    return UIDevice.current.modelName
  }

  func systemVersion() -> String {
    return UIDevice.current.systemVersion
  }
}
