//
//  AppMock.swift
//  UppyTests
//
//  Created by Arpit Williams on 07/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import UIKit
@testable import Uppy

class AppMock: AppProtocol {
  
  // Inputs
  private let mockName = "test"
  private let mockVersion = "0.0.0"
  
  // Outputs
  var openUrl = (called: false, url: "")
  var waitForReadyCalled = false
  var otaAlert = (called: false, message: "")
  var updateHandler: (() -> Void)?
  var presentModal: (called: Bool, viewController: UIViewController?) = (false, nil)
  
  
  // AppProtocol
  
  func bundleId() -> String {
    return mockName
  }
  
  func getVersion() -> String {
    return mockVersion
  }
  
  func getVersionName() -> String {
    return mockName
  }
  
  func getSDKVersion() -> String {
    return mockVersion
  }
  
  func openUrl(_ url: String) {
    self.openUrl = (true, url)
  }
  
  func waitForReadyThen(_ onReady: @escaping () -> Void) {
    self.waitForReadyCalled = true
    onReady()
  }
  
  func showOtaAlert(_ message: String, updateHandler: @escaping () -> Void) {
    self.otaAlert = (true, message)
    self.updateHandler = updateHandler
  }
  
  func presentModal(_ viewController: UIViewController, animated: Bool) {
    self.presentModal = (true, viewController)
  }
}
