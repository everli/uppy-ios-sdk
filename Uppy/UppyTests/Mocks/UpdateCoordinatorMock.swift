//
//  UpdateCoordinatorMock.swift
//  UppyTests
//
//  Created by Arpit Williams on 07/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation
@testable import Uppy

class UpdateCoordinatorMock: UpdateCoordinator, UpdateInteractorOutputMock {

  private(set) var forceUpdateCalled = false
  private(set) var otaUpdateCalled = false
  private(set) var customModeCalled = false
  
  func forceUpdateMock() {
    guard sdkMode == .native else { customModeCalled = true ; return }
    forceUpdateCalled = true
  }

  func otaUpdateMock() {
    guard sdkMode == .native else { customModeCalled = true ; return }
    otaUpdateCalled = true
  }
}
