//
//  Codable+Extension.swift
//  Uppy
//
//  Created by Arpit Williams on 02/02/21.
//  Copyright © 2021 Everli. All rights reserved.
//

import Foundation

struct JSON {
  static let encoder = JSONEncoder()
}

extension Encodable {
  var dictionary: [String: Any] {
    return (try? JSONSerialization.jsonObject(with: JSON.encoder.encode(self))) as? [String: Any] ?? [:]
  }
}
