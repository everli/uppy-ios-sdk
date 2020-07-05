//
//  ErrorFactory.swift
//  Uppy
//
//  Created by Arpit Williams on 03/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation

class ErrorFactory {

  private static let decoder = JSONDecoder()

  static func decodeError(from response: Response) throws -> ErrorResponse? {
    guard let data = response.data else { return nil }
    return try? ErrorFactory.decoder.decode(ErrorResponse.self, from: data)
  }

  static func buildError(message: String, errorCode: ErrorCode) -> NSError {
    return NSError(domain: GlobalConfig.ErrorDomain, code: errorCode.rawValue, userInfo: [GlobalConfig.ErrorKey: message])
  }
}
