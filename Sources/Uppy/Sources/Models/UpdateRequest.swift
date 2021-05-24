//
//  UpdateRequest.swift
//  Uppy
//
//  Created by Arpit Williams on 02/02/21.
//  Copyright © 2021 Everli. All rights reserved.
//

import Foundation

struct UpdateRequest: Codable, Equatable {
  let deviceID: String?
  let version: String
}

extension UpdateRequest {
  enum CodingKeys: String, CodingKey {
    case deviceID = "device_id"
    case version
  }
}
