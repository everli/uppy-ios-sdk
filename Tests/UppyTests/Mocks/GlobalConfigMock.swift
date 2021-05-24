//
//  GloobalConfigMock.swift
//  UppyTests
//
//  Created by Arpit Williams on 07/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation
@testable import Uppy

class GlobalConfigMock: GlobalConfig {
  
  override init() {
    super.init()
    self.app = AppMock()
    self.device = DeviceMock()
  }
}
