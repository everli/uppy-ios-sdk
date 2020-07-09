//
//  Dispatch.swift
//  Uppy
//
//  Created by Arpit Williams on 02/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation

func runInBackground(_ code: @escaping () -> Void) {
  DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated).async(execute: code)
}

func runOnMainThreadAsync(_ code: @escaping () -> Void) {
  DispatchQueue.main.async(execute: code)
}

func runOnMainThreadSynced(_ code: @escaping () -> Void) {
  DispatchQueue.main.sync(execute: code)
}

func sleep(for seconds: TimeInterval) {
  Thread.sleep(forTimeInterval: seconds)
}
