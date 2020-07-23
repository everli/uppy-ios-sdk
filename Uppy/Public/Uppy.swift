//
//  Uppy.swift
//  Uppy
//
//  Created by Arpit Williams on 02/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation

@objc public class Uppy: NSObject {

  @objc public static let shared = Uppy()

  // MARK: - Public Properties

  @objc public var logLevel: LogLevel = .info { didSet { globalConfig.logLevel = logLevel } }

  // MARK: - Private properties

  private let globalConfig: GlobalConfig

  private let updateInteractor: UpdateInteractor
  private let updateCoordinator: UpdateCoordinator

  private var updateCompletionHandler: ((String, Bool) -> Void)?

  // MARK: - Initializers

  override convenience init() {
    self.init(config: GlobalConfig.shared,
              updateInteractor: InteractorFactory.buildUpdateInteractor(),
              updateCoordinator: UpdateCoordinator())
    updateInteractor.output = updateCoordinator
    updateCoordinator.output = self
  }

  internal init(config: GlobalConfig,
                updateInteractor: UpdateInteractor,
                updateCoordinator: UpdateCoordinator) {
    globalConfig = config
    self.updateInteractor = updateInteractor
    self.updateCoordinator = updateCoordinator
  }
}

// MARK: - Public methods

extension Uppy {

  /*
   Initializes sdk with given mode
   - Parameters:
      - baseUrl: String - Provides url path for Uppy server.
      - mode: SDKMode - Provides native or custom view for updating to latest build.
   */
  @objc public func initialize(with baseUrl: String, and mode: SDKMode = .native) {
    globalConfig.baseUrl = baseUrl
    updateCoordinator.sdkMode = mode
    updateInteractor.start()
  }

  /*
   Gets update data for the latest build
   - Completion handler parameters:
      - downloadUrl: String - Contains the download link for the latest build.
      - isForced: Bool - Checks if the latest update is forced.
   - NOTE: Be sure to call `initiate(with mode:)` before calling this method.
   */
  @objc public func getUpdate(with completionHandler: ((_ downloadUrl: String, _ isForced: Bool) -> Void)?) {
    updateCompletionHandler = completionHandler
  }
}

// MARK: - Update coordinator output

extension Uppy: UpdateCoordinatorOutput {

  func forceUpdateClient(with downloadUrl: String) {
    updateCompletionHandler?(downloadUrl, true)
  }

  func otaUpdateClient(with downloadUrl: String) {
    updateCompletionHandler?(downloadUrl, false)
  }
}

// Type of logs which needs to be displayed
@objc public enum LogLevel: Int {

  // No log will be shown
  case none = 0

  // Only warnings and errors
  case error = 1

  // Errors and relevant information
  case info = 2

  // Requests and Responses from server will be displayed
  case debug = 3
}

// Type of SDK Mode mainly for controlling view
@objc public enum SDKMode: Int {
  case native
  case custom
}
