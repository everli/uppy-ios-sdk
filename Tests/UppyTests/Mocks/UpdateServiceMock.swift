//
//  UpdateInteractorMock.swift
//  UppyTests
//
//  Created by Arpit Williams on 07/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

@testable import Uppy
import Foundation

class UpdateServiceMock: UpdateService {
  
  override init() {
    super.init()
    let updatesApi = "/api/v2/applications/\(GlobalConfig.shared.applicationID)/updates/iOS"
    StubResponse.mockResponse(for: updatesApi, with: "Update.json")
  }
}
