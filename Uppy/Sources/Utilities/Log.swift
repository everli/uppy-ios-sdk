//
//  Log.swift
//  Uppy
//
//  Created by Arpit Williams on 02/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation

func >= (levelA: LogLevel, levelB: LogLevel) -> Bool {
  return levelA.rawValue >= levelB.rawValue
}

func log(_ log: String) {
  print("☀️ UPPY:: " + log)
}

func logInfo(_ message: String) {
  guard GlobalConfig.shared.logLevel >= .info else { return }
  log(message)
}

func logWarn(_ message: String, filename: NSString = #file, line: Int = #line, funcname: String = #function) {
  guard GlobalConfig.shared.logLevel >= .error else { return }
  let caller = "\(filename.lastPathComponent)(\(line)) \(funcname)"
  log("☣️☣️☣️ WARNING: " + message)
  log("☣️☣️☣️ ⤷ FROM CALLER: " + caller + "\n")
}

func logError(_ error: NSError?, filename: NSString = #file, line: Int = #line, funcname: String = #function) {
  guard GlobalConfig.shared.logLevel >= .error, let err = error else { return }
  let function = "\(filename.lastPathComponent)(\(line)) \(funcname)"
  log("🔥🔥🔥 ERROR: " + err.localizedDescription)
  log("🔥🔥🔥 ⤷ FROM FUNCTION: " + function)
  log("🔥🔥🔥 ⤷ USER INFO: \(err.userInfo)\n")
}

func logError(_ error: ErrorResponse?, filename: NSString = #file, line: Int = #line, funcname: String = #function) {
  guard GlobalConfig.shared.logLevel >= .error, let error = error else { return }
  let function = "\(filename.lastPathComponent)(\(line)) \(funcname)"
  log("🔥🔥🔥 RESPONSE ERROR: " + (error.getMessage ?? "NO RESPONSE ERROR"))
  log("🔥🔥🔥 ⤷ FROM FUNCTION: " + function)
  log("🔥🔥🔥 \n")
}
