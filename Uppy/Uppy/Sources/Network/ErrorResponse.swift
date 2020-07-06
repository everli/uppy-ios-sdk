//
//  ErrorResponse.swift
//  Uppy
//
//  Created by Arpit Williams on 03/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation

struct ErrorResponse: Swift.Error, Codable {

  private(set) var status: Int?
  private(set) var code: Int?
  private(set) var message: String?
}

extension ErrorResponse {

  enum CodingKeys: String, CodingKey {
    case error
    case status
    case code
    case message
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    if let errorContainer = try? container.nestedContainer(keyedBy: CodingKeys.self, forKey: .error) {
      status = try? errorContainer.decode(Int.self, forKey: .status)
      code = try? errorContainer.decode(Int.self, forKey: .code)
      message = try? errorContainer.decode(String.self, forKey: .message)
    }
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    var errorContainer = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .error)
    try? errorContainer.encode(status, forKey: .status)
    try? errorContainer.encode(code, forKey: .code)
    try? errorContainer.encode(message, forKey: .message)
  }
}

// MARK: - Public Helpers

extension ErrorResponse {

  var getMessage: String? {
    guard let message = message, message.isEmpty == false else { return nil }
    return message
  }
}
