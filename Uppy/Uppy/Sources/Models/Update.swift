//
//  Update.swift
//  Uppy
//
//  Created by Arpit Williams on 02/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation

struct Update: Codable, Equatable {
  
  let forced: Bool
  let version: String?
  let downloadUrl: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    version = try? container.decode(String.self, forKey: .version)
    forced = (try? container.decode(Bool.self, forKey: .forced)) ?? false
    downloadUrl = try? container.decode(String.self, forKey: .downloadUrl)
  }
}

extension Update {
  enum CodingKeys: String, CodingKey {
    case forced
    case version
    case downloadUrl = "download_url"
  }
}
