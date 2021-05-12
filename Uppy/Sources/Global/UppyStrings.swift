//
//  UppyStrings.swift
//  Uppy
//
//  Created by Arpit Williams on 05/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation

public struct UppyStrings {

  // Generic
  var appName: String
  var cancelButton: String
  var retryButton: String
  var okButton: String
  var laterButton: String
  var updateButton: String

  // Alert Messages
  var otaUpdateMessage: String
  var forceUpdateMessage: String

  public init(appName: String = localize("appName"),
              cancelButton: String = localize("cancelButton"),
              retryButton: String = localize("retryButton"),
              okButton: String = localize("okButton"),
              laterButton: String = localize("laterButton"),
              updateButton: String = localize("updateButton"),
              otaUpdateMessage: String = localize("otaUpdateMessage"),
              forceUpdateMessage: String = localize("forceUpdateMessage")) {
    self.appName = appName
    self.cancelButton = cancelButton
    self.retryButton = retryButton
    self.okButton = okButton
    self.laterButton = laterButton
    self.updateButton = updateButton
    self.otaUpdateMessage = otaUpdateMessage
    self.forceUpdateMessage = forceUpdateMessage
  }
}
