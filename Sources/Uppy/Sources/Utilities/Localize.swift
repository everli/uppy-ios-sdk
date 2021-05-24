//
//  Localize.swift
//  Uppy
//
//  Created by Arpit Williams on 05/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation

public func localize(_ key: String) -> String {
  return NSLocalizedString(key, tableName: nil, bundle: Bundle.module, value: "", comment: "")
}
