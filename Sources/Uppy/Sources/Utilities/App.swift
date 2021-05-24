//
//  App.swift
//  Uppy
//
//  Created by Arpit Williams on 02/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation
import UIKit

// Protocol for host app operation
protocol AppProtocol {
  func getAppVersion() -> String
  func openUrl(_ url: String)
  func waitForReadyThen(_ onReady: @escaping () -> Void)
  func showOtaAlert(_ message: String, updateHandler: @escaping () -> Void)
  func presentModal(_ viewController: UIViewController, animated: Bool)
}

class App: AppProtocol {

  // MARK: - Properties

  private lazy var alertOta: UIAlertController = UIAlertController()

  // MARK: - Public Helpers

  func getAppVersion() -> String {
    guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {
      return "NO_APP_VERSION_FOUND"
    }
    return version
  }

  func openUrl(_ urlString: String) {
    logInfo("Opening \(urlString)")
    guard let url = URL(string: urlString) else { return }
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
  }

  // MARK: - View Methods

  func waitForReadyThen(_ onReady: @escaping () -> Void) {
    runInBackground { self.sleepUntilReady(); runOnMainThreadAsync(onReady) }
  }

  func showOtaAlert(_ message: String, updateHandler: @escaping () -> Void) {
    alertOta = UIAlertController(title: StringLiteral.appName.value, message: message, preferredStyle: .alert)
    alertOta.addAction(UIAlertAction(title: StringLiteral.laterButton.value, style: .cancel, handler: nil))
    alertOta.addAction(UIAlertAction(title: StringLiteral.updateButton.value, style: .default) { _ in updateHandler() })
    topViewController?.present(alertOta, animated: true, completion: nil)
  }

  func presentModal(_ viewController: UIViewController, animated: Bool) {
    viewController.modalPresentationStyle = .overFullScreen
    topViewController?.present(viewController, animated: animated, completion: nil)
  }
}

// MARK: - Private Helpers

extension App {

  private var topViewController: UIViewController? {
    var rootViewController = UIApplication.shared.keyWindow?.rootViewController
    while let presentedViewController = rootViewController?.presentedViewController { rootViewController = presentedViewController }
    return rootViewController
  }

  private var rootViewIsReady: Bool {
    var isReady = false
    runOnMainThreadSynced { isReady = UIApplication.shared.keyWindow?.rootViewController?.isViewLoaded ?? false }
    return isReady
  }

  private func sleepUntilReady() {
    while rootViewIsReady == false { sleep(for: 0.1) }
  }
}
