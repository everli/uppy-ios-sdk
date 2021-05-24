//
//  UpdateManagerTests.swift
//  UppyTests
//
//  Created by Arpit Williams on 07/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation

@testable import Uppy
import OHHTTPStubs
import XCTest

class UpdateManagerTests: XCTestCase {
  
  var updateManager: UpdateManager!
  var updateService: UpdateServiceMock!
  
  override func setUp() {
    super.setUp()
    updateService = UpdateServiceMock()
    updateManager = UpdateManager(updateService: updateService)
  }
  
  override func tearDown() {
    updateService = nil
    updateManager = nil
    HTTPStubs.removeAllStubs()
    super.tearDown()
  }
  
  func testNotNil() {
    XCTAssertNotNil(updateService)
    XCTAssertNotNil(updateManager)
  }
  
  func testCheckUpdate() {
    
    let checkUpdateCalled = expectation(description: "checkUpdateCalled")
    updateManager.checkUpdates(for: GlobalConfigMock().app.getAppVersion()) { (update, error) in
      checkUpdateCalled.fulfill()
      
      XCTAssert(update?.forced == true)
      XCTAssert(update?.version == "0.0.0")
      XCTAssert(update?.downloadUrl == "test.com")
    }
    
    waitForExpectations(timeout: 0.1, handler: nil)
  }
}
