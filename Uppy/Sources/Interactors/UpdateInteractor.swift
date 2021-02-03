//
//  UpdateInteractor.swift
//  Uppy
//
//  Created by Arpit Williams on 02/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation

protocol UpdateInteractorOutput {
  func forceUpdate(update: Update)
  func otaUpdate(update: Update)
}

class UpdateInteractor {

  var output: UpdateInteractorOutput?

  private let globalConfig: GlobalConfig
  private let updateManager: UpdateManager

  init(globalConfig: GlobalConfig, updateManager: UpdateManager) {
    self.globalConfig = globalConfig
    self.updateManager = updateManager
  }

  func start() {
    logInfo("UPPY INITIALIZED 🕊")
    logInfo("SDK Version: \(globalConfig.app.getSDKVersion())")
    checkUpdates(for: globalConfig.app.getVersion(), and: globalConfig.deviceID)
  }

  func checkUpdates(for appVersion: String, and deviceID: String? = nil) {
    updateManager.checkUpdates(for: appVersion, and: deviceID) { [weak self] update, error in
      guard let update = update, error == nil else { logError(error); return }
      update.forced ? self?.output?.forceUpdate(update: update) : self?.output?.otaUpdate(update: update)
    }
  }
}
