//
//  UpdatePresenterTests.swift
//  UppyTests
//
//  Created by Arpit Williams on 08/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import XCTest
@testable import Uppy

class UpdatePresenterTests: XCTestCase {
  
  var updatePresenter: UpdatePresenter!
  var updateCoordinator: UpdateCoordinatorMock!
  
  override func setUp() {
    super.setUp()
    updateCoordinator = UpdateCoordinatorMock()
    updatePresenter = UpdatePresenter(with: updateCoordinator)
  }
  
  override func tearDown() {
    updateCoordinator = nil
    updatePresenter = nil
    super.tearDown()
  }
  
  func testNotNil() {
    XCTAssertNotNil(updateCoordinator)
    XCTAssertNotNil(updatePresenter)
  }
}

