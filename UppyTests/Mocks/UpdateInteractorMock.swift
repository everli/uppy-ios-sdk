//
//  UpdateInteractorMock.swift
//  UppyTests
//
//  Created by Arpit Williams on 07/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation
@testable import Uppy

protocol UpdateInteractorOutputMock {
  func forceUpdateMock()
  func otaUpdateMock()
}

class UpdateInteractorMock: UpdateInteractor {

  var isForcedMock = false
  var outputMock: UpdateInteractorOutputMock?
  
  private(set) var startCalled = false
  private(set) var checkUpdatesCalled = false

  override func start() {
    startCalled = true
    checkUpdates(for: GlobalConfigMock().app.getVersion())
  }

  override func checkUpdates(for appVersion: String, and deviceID: String? = nil) {
    checkUpdatesCalled = true
    isForcedMock ? outputMock?.forceUpdateMock() : outputMock?.otaUpdateMock()
  }
}
