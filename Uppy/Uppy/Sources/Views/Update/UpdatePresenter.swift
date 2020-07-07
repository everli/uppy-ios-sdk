//
//  UpdatePresenter.swift
//  Uppy
//
//  Created by Arpit Williams on 05/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation

protocol UpdatePresenterOutput {
  func setForceUpdateMessage(_ message: String)
}

class UpdatePresenter {

  var output: UpdatePresenterOutput?
  var coordinator: UpdateCoordinator

  init(with coordinator: UpdateCoordinator) {
    self.coordinator = coordinator
  }

  func viewDidLoad() {
    output?.setForceUpdateMessage(Strings.forceUpdateMessage)
  }

  func didTappedUpdateButton() {
    coordinator.openDownloadLink()
  }
}
