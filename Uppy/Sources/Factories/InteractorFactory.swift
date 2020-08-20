//
//  InteractorFactory.swift
//  Uppy
//
//  Created by Arpit Williams on 02/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation

struct InteractorFactory {

  static func buildUpdateInteractor() -> UpdateInteractor {
    let updateService = UpdateService()
    let updateManager = UpdateManager(updateService: updateService)
    return UpdateInteractor(globalConfig: GlobalConfig.shared, updateManager: updateManager)
  }
}
