//
//  UpdateCoordinatorTests.swift
//  UppyTests
//
//  Created by Arpit Williams on 08/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

@testable import Uppy
import XCTest

class UpdateCoordinatorTests: XCTestCase {
  
  var updateCoordinator: UpdateCoordinator!
  
  override func setUp() {
    super.setUp()
    updateCoordinator = UpdateCoordinator()
  }
  
  override func tearDown() {
    updateCoordinator = nil
    super.tearDown()
  }
  
  func testNotNil() {
    XCTAssertNotNil(updateCoordinator)
    XCTAssertNotNil(updateCoordinator.sdkMode)
  }
  
  func testDefaultSDKMode() {
    XCTAssert(updateCoordinator.sdkMode == .native)
  }
}
