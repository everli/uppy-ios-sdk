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
    StubResponse.mockResponse(for: "/api/v1/applications/\(GlobalConfig.applicationSlug)/updates/iOS/\(GlobalConfigMock().app.getVersion())", with: "Update.json")
  }
}
