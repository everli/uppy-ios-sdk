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

  var interactor: UpdateInteractor
  var output: UpdatePresenterOutput?

  init(with interactor: UpdateInteractor) {
    self.interactor = interactor
  }

  func viewDidLoad() {
    output?.setForceUpdateMessage(Strings.forceUpdateMessage)
  }

  func didTappedUpdateButton() {
    interactor.openDownloadLink()
  }
}
