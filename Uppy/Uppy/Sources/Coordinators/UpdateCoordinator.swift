//
//  UpdateCoordinator.swift
//  Uppy
//
//  Created by Arpit Williams on 03/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import UIKit

protocol UpdateCoordinatorOutput {
  func forceUpdateClient(with downloadUrl: String)
  func otaUpdateClient(with downloadUrl: String)
}

class UpdateCoordinator {

  var output: UpdateCoordinatorOutput?
  var updateInteractor: UpdateInteractor
  var sdkMode: SDKMode = .native

  private let app = GlobalConfig.shared.app

  // MARK: - Initializers

  init(updateInteractor: UpdateInteractor) {
    self.updateInteractor = updateInteractor
    self.updateInteractor.output = self
  }
}

// MARK: - Update InteractorO utput

extension UpdateCoordinator: UpdateInteractorOutput {

  func forceUpdate(update: Update) {

    guard sdkMode == .native else {
      output?.forceUpdateClient(with: update.downloadUrl ?? "")
      return
    }

    let updatePresenter = UpdatePresenter(with: updateInteractor)
    let updateStoryboard = UIStoryboard(name: "Update", bundle: Bundle.uppy())
    let updateViewController = updateStoryboard.instantiateViewController(withIdentifier: "UpdateViewController") as! UpdateViewController
    updateViewController.updatePresenter = updatePresenter

    let navigationController = UINavigationController(rootViewController: updateViewController)

    app.waitForReadyThen { [weak self] in
      self?.app.presentModal(navigationController, animated: true)
    }
  }

  func otaUpdate(update: Update) {

    guard sdkMode == .native else {
      output?.otaUpdateClient(with: update.downloadUrl ?? "")
      return
    }

    app.waitForReadyThen { [weak self] in
      self?.app.showOtaAlert(Strings.otaUpdateMessage, updateHandler: { [weak self] in
        _ = self?.app.openUrl(update.downloadUrl ?? "")
      })
    }
  }
}
