//
//  UpdateInteractorTests.swift
//  UppyTests
//
//  Created by Arpit Williams on 08/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import Uppy

class UpdateInteractorTests: XCTestCase {
  
  var updateInteractor: UpdateInteractor!
  var updateService: UpdateServiceMock!
  
  override func setUp() {
    super.setUp()
    updateService = UpdateServiceMock()
    updateInteractor = UpdateInteractor(globalConfig: GlobalConfigMock(), updateManager: UpdateManager(updateService: updateService))
  }
  
  override func tearDown() {
    updateInteractor = nil
    updateService = nil
    HTTPStubs.removeAllStubs()
    super.tearDown()
  }
  
  func testNotNil() {
    XCTAssertNotNil(updateInteractor)
    XCTAssertNotNil(updateService)
  }
}
