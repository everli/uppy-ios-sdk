//
//  UppyTests.swift
//  UppyTests
//
//  Created by Arpit Williams on 30/06/20.
//  Copyright © 2020 Everli. All rights reserved.
//

@testable import Uppy
import OHHTTPStubs
import XCTest

class UppyTests: XCTestCase {
  
  var uppy: Uppy!
  var globalConfig: GlobalConfigMock!
  var updateService: UpdateServiceMock!
  var updateInteractor: UpdateInteractorMock!
  var updateCoordinator: UpdateCoordinatorMock!
  
  override func setUp() {
    super.setUp()
    globalConfig = GlobalConfigMock()
    updateService = UpdateServiceMock()
    updateInteractor = UpdateInteractorMock(globalConfig: globalConfig, updateManager: UpdateManager(updateService: updateService))
    updateCoordinator = UpdateCoordinatorMock()
    updateInteractor.outputMock = updateCoordinator
    uppy = Uppy(config: globalConfig, updateInteractor: updateInteractor, updateCoordinator: updateCoordinator)
  }
  
  override func tearDown() {
    uppy = nil
    globalConfig = nil
    updateService = nil
    updateInteractor = nil
    updateCoordinator = nil
    HTTPStubs.removeAllStubs()
    super.tearDown()
  }
  
  func testNotNil() {
    XCTAssertNotNil(uppy)
    XCTAssertNotNil(globalConfig)
    XCTAssertNotNil(updateService)
    XCTAssertNotNil(updateInteractor)
    XCTAssertNotNil(updateCoordinator)
  }
  
  func testForceUpdate() {
    updateInteractor.isForcedMock = true
    uppy.initialize(with: "www.test.com")
    XCTAssertTrue(updateInteractor.startCalled)
    XCTAssertTrue(updateInteractor.checkUpdatesCalled)
    XCTAssertTrue(updateCoordinator.forceUpdateCalled)
    XCTAssertFalse(updateCoordinator.otaUpdateCalled)
  }
  
  func testOTAUpdate() {
    updateInteractor.isForcedMock = false
    uppy.initialize(with: "www.test.com")
    XCTAssertTrue(updateInteractor.startCalled)
    XCTAssertTrue(updateInteractor.checkUpdatesCalled)
    XCTAssertTrue(updateCoordinator.otaUpdateCalled)
    XCTAssertFalse(updateCoordinator.forceUpdateCalled)
  }
  
  func testCustomMode() {
    uppy.initialize(with: "www.test.com", and: .custom)
    XCTAssertTrue(updateInteractor.startCalled)
    XCTAssertTrue(updateInteractor.checkUpdatesCalled)
    XCTAssertTrue(updateCoordinator.customModeCalled)
    XCTAssertFalse(updateCoordinator.otaUpdateCalled)
    XCTAssertFalse(updateCoordinator.forceUpdateCalled)
  }
}
