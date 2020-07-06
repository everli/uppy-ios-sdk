//
//  UpdateManager.swift
//  Uppy
//
//  Created by Arpit Williams on 02/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation

protocol UpdateManagerProtocol {
  func checkUpdates(completionHandler: @escaping (Update?, ErrorResponse?) -> Void)
}

class UpdateManager: UpdateManagerProtocol {

  fileprivate let updateService: UpdateService

  init(updateService: UpdateService) {
    self.updateService = updateService
  }

  func checkUpdates(completionHandler: @escaping (Update?, ErrorResponse?) -> Void) {
    updateService.checkUpdates { completionHandler($0?.data, $1) }
  }
}
