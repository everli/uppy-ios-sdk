//
//  UpdateRequestTests.swift
//  UppyTests
//
//  Created by Arpit Williams on 02/02/21.
//  Copyright © 2021 Everli. All rights reserved.
//

import Foundation

import XCTest
@testable import Uppy

class UpdateRequestTests: XCTestCase {
  
  var updateRequest: UpdateRequest!
  
  private let encoder = JSONEncoder()
  private let decoder = JSONDecoder()
  
  override func setUp() {
    super.setUp()
    updateRequest = UpdateRequest(deviceID: "0", version: "0.0.0")
  }
  
  override func tearDown() {
    updateRequest = nil
    super.tearDown()
  }
  
  func testNotNil() {
    XCTAssertNotNil(updateRequest)
  }
  
  func testForDictionary() {
    XCTAssertNotNil(updateRequest.dictionary)
    XCTAssert(updateRequest.dictionary["device_id"] as? String == "0")
    XCTAssert(updateRequest.dictionary["version"] as? String == "0.0.0")
  }
  
  func testForValidPayload() {
    let payload = ["device_id": "0", "version": "0.0.0"]
    let jsonData = try! encoder.encode(payload)
    updateRequest = try? decoder.decode(UpdateRequest.self, from: jsonData)
    XCTAssertNotNil(updateRequest)
    XCTAssertNotNil(updateRequest.dictionary)
    XCTAssert(updateRequest.dictionary["device_id"] as? String == "0")
    XCTAssert(updateRequest.dictionary["version"] as? String == "0.0.0")
  }
  
  func testForValidPayloadWithoutDeviceID() {
    let payload = ["version": "0.0.0"]
    let jsonData = try! encoder.encode(payload)
    updateRequest = try? decoder.decode(UpdateRequest.self, from: jsonData)
    XCTAssertNotNil(updateRequest)
    XCTAssertNotNil(updateRequest.dictionary)
    XCTAssertNil(updateRequest.deviceID)
    XCTAssert(updateRequest.version == "0.0.0")
  }
  
  func testForInValidPayload() {
    let payload = ["device_id": nil, "version": 4]
    let jsonData = try! encoder.encode(payload)
    updateRequest = try? decoder.decode(UpdateRequest.self, from: jsonData)
    XCTAssertNil(updateRequest)
    XCTAssert(updateRequest.dictionary.count == 0)
  }
}
