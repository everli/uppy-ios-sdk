//
//  Bundle+Extension.swift
//  Uppy
//
//  Created by Arpit Williams on 02/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation

extension Bundle {
  class func uppy() -> Bundle {
    Bundle(for: Uppy.self).url(forResource: "Uppy", withExtension: "bundle").flatMap(Bundle.init(url:)) ?? Bundle(for: Uppy.self)
  }
}
