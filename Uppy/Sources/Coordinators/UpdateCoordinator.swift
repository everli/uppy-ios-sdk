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

  var sdkMode: SDKMode = .native
  var output: UpdateCoordinatorOutput?

  private var downloadLink = ""
  private let app = GlobalConfig.shared.app

  func openDownloadLink() {
    app.openUrl(downloadLink)
  }
}

// MARK: - Update InteractorO utput

extension UpdateCoordinator: UpdateInteractorOutput {

  func forceUpdate(update: Update) {

    downloadLink = update.downloadUrl ?? ""
    output?.forceUpdateClient(with: downloadLink)

    guard sdkMode == .native else { return }

    let updatePresenter = UpdatePresenter(with: self)
    let updateStoryboard = UIStoryboard(name: "Update", bundle: Bundle.uppy())
    let updateViewController = updateStoryboard.instantiateViewController(withIdentifier: "UpdateViewController") as! UpdateViewController
    updateViewController.updatePresenter = updatePresenter

    let navigationController = UINavigationController(rootViewController: updateViewController)
    app.waitForReadyThen { [weak self] in self?.app.presentModal(navigationController, animated: true) }
  }

  func otaUpdate(update: Update) {

    output?.otaUpdateClient(with: update.downloadUrl ?? "")

    guard sdkMode == .native else { return }

    app.waitForReadyThen { [weak self] in
      self?.app.showOtaAlert(Strings.otaUpdateMessage, updateHandler: { [weak self] in
        self?.app.openUrl(update.downloadUrl ?? "")
      })
    }
  }
}
