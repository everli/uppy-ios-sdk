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

enum StringLiteral {

  case appName
  case cancelButton
  case retryButton
  case okButton
  case laterButton
  case updateButton
  case otaUpdateMessage
  case forceUpdateMessage

  var value: String {
    let strings = GlobalConfig.shared.strings
    switch self {
    case .appName: return strings.appName
    case .cancelButton: return strings.cancelButton
    case .retryButton: return strings.retryButton
    case .okButton: return strings.okButton
    case .laterButton: return strings.laterButton
    case .updateButton: return strings.updateButton
    case .otaUpdateMessage: return strings.otaUpdateMessage
    case .forceUpdateMessage: return strings.forceUpdateMessage
    }
  }
}
