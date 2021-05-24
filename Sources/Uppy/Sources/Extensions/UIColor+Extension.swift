//
//  UIColor+Extension.swift
//  Uppy
//
//  Created by Arpit Williams on 05/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import UIKit

extension UIColor {

  public convenience init(hex: UInt32, alpha: CGFloat = 1) {
    let div = CGFloat(255)
    let red = CGFloat((hex & 0xFF0000) >> 16) / div
    let green = CGFloat((hex & 0x00FF00) >> 8) / div
    let blue = CGFloat(hex & 0x0000FF) / div

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}

// MARK: - Custom colors

extension UIColor {

  struct Violet {
    static let Camerlot = UIColor(hex: 0x8A3264)
  }
}
