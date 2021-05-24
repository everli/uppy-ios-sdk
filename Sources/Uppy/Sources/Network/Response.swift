//
//  Response.swift
//  Uppy
//
//  Created by Arpit Williams on 02/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation

class Response {

  var data: Data?
  var url: URL?
  var statusCode = -1
  var error: NSError?
  var headers: [String: String]?
  var isSuccess = false

  init(data: Data?, response: URLResponse?, error: NSError?) {
    do {
      // Response
      guard let response = response as? HTTPURLResponse else {
        throw error ?? ErrorFactory.buildError(message: "Response is nil", errorCode: .unknown)
      }
      url = response.url
      statusCode = response.statusCode
      headers = response.allHeaderFields as? [String: String]

      // Data
      guard let data = data else {
        throw ErrorFactory.buildError(message: "Response data is nil", errorCode: .unknown)
      }
      self.data = data
      isSuccess = true

    } catch let error as NSError {
      // Error
      self.error = error
      self.statusCode = error.code
      self.isSuccess = false
    }

    logResponse()
  }

  // MARK: - Private Helpers

  private func logResponse() {
    guard GlobalConfig.shared.logLevel == .debug else { return }

    log("******** RESPONSE ********")
    log(" - URL:\t" + logURL())
    log(" - CODE:\t" + "\(statusCode)")
    logHeaders()
    log(" - DATA:\n" + logData())
    log("*************************\n")
  }

  private func logURL() -> String {
    guard let url = self.url?.absoluteString else { return "NO URL" }
    return url
  }

  private func logHeaders() {
    guard let headers = self.headers else { return }
    log(" - HEADERS: {")
    for key in headers.keys {
      if let value = headers[key] {
        log("\t\t\(key): \(value)")
      }
    }
    log("}")
  }

  private func logData() -> String {
    guard let data = self.data else { return "NO DATA" }
    guard let dataJson = try? JSONSerialization.jsonObject(with: data, options: []) else {
      return String(data: data, encoding: String.Encoding.utf8) ?? "Error parsing JSON"
    }
    return "\(dataJson)"
  }
}
