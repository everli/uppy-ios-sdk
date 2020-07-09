//
//  ResponseType.swift
//  Uppy
//
//  Created by Arpit Williams on 03/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation

struct ArrayResponse<T: Codable>: Codable {
  let data: [T]
}

struct ObjectResponse<T: Codable>: Codable {
  let data: T
}

struct StringResponse: Codable {
  let data: String
}
