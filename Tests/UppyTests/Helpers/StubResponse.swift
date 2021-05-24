//
//  StubResponse.swift
//  UppyTests
//
//  Created by Arpit Williams on 07/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation
import OHHTTPStubs
import OHHTTPStubsSwift
@testable import Uppy

class StubResponse {
  
  class func mockResponse(for urlPath: String, with jsonFile: String) {
    _ = stub(condition: isPath(urlPath), response: { _ in
      return StubResponse.stubResponse(with: jsonFile)
    })
  }
  
  class func stubResponse(with json: String) -> HTTPStubsResponse {
    return HTTPStubsResponse(
      fileAtPath: OHPathForFileInBundle(json, Bundle.module)!,
      statusCode: 200,
      headers: ["Content-Type": "application/json"]
    )
  }
}
