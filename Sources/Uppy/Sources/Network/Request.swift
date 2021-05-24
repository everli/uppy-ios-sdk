//
//  Request.swift
//  Uppy
//
//  Created by Arpit Williams on 02/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
  case GET, POST, PUT, DELETE
}

class Request {

  // MARK: - Properties

  var endpoint: String
  var method: String
  var urlParams: [String: String]
  var bodyParams: [String: Any?]

  private var headers: [String: String]?
  private var request: URLRequest?

  // MARK: - Initializer

  init(endpoint: String, method: HTTPMethod = .GET, urlParams: [String: String] = [:], bodyParams: [String: Any] = [:]) {
    self.method = method.rawValue
    self.endpoint = endpoint
    self.urlParams = urlParams
    self.bodyParams = bodyParams
  }

  // MARK: - Public Helpers

  func sendAsync(_ completionHandler: @escaping (Response) -> Void) {
    buildRequest()
    guard let request = self.request else { return logWarn("Couldn't build the request") }
    logRequest()

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      let res = Response(data: data, response: response, error: error as NSError?)
      DispatchQueue.main.async { completionHandler(res) }
    }
    task.resume()
  }

  // MARK: - Private Helpers

  private func buildRequest() {
    guard let url = buildURL() else { return logWarn("Could not build the URL") }
    request = URLRequest(url: url)
    request?.httpMethod = method
    if method != "GET" {
      let body = bodyParams.filter { $0.value != nil }.mapValues { $0 }
      request?.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
    }
    setHeaders()
  }

  private func buildURL() -> URL? {
    guard var url = URLComponents(string: GlobalConfig.shared.baseUrl) else { return nil }
    url.path += endpoint
    if urlParams.isEmpty == false { url.queryItems = urlParams.map(URLQueryItem.init(name:value:)) }
    return url.url
  }

  private func setHeaders() {

    let userAgent = "ios/" + // OS
      GlobalConfig.shared.device.systemVersion() + "/" + // OS Version
      "Apple/" + // Device manufacturer
      GlobalConfig.shared.device.model() // Device model

    request?.setValue(userAgent, forHTTPHeaderField: "User-Agent")
    request?.addValue("application/json", forHTTPHeaderField: "Accept")
    request?.addValue("application/json", forHTTPHeaderField: "Content-Type")
  }

  private func logRequest() {

    guard GlobalConfig.shared.logLevel == .debug else { return }

    let url = request?.url?.absoluteString ?? "INVALID URL"
    log("******** REQUEST ********")
    log(" - URL:\t" + url)
    log(" - METHOD:\t" + (request?.httpMethod ?? "INVALID REQUEST"))
    logHeaders()
    logBody()
    log("*************************\n")
  }

  private func logBody() {
    guard let body = request?.httpBody, let json = try? JSONSerialization.jsonObject(with: body, options: []) else { return }
    log(" - BODY:\n\(json)")
  }

  private func logHeaders() {
    guard let headers = request?.allHTTPHeaderFields else { return }
    log(" - HEADERS: {")
    for key in headers.keys {
      if let value = headers[key] {
        log("\t\t\(key): \(value)")
      }
    }
    log("}")
  }
}
