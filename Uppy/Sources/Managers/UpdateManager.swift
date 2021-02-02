//
//  UpdateManager.swift
//  Uppy
//
//  Created by Arpit Williams on 02/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation

class UpdateManager {

  private let updateService: UpdateService

  init(updateService: UpdateService) {
    self.updateService = updateService
  }

  func checkUpdates(for appVersion: String,
                    and deviceID: String? = nil,
                    with completionHandler: @escaping (Update?, ErrorResponse?) -> Void) {
    updateService.checkUpdates(for: appVersion, and: deviceID) { completionHandler($0?.data, $1) }
  }
}
