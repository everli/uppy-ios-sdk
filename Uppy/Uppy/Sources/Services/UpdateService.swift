//
//  UpdateService.swift
//  Uppy
//
//  Created by Arpit Williams on 02/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation

class UpdateService {

  func checkUpdates(_ completionHandler: @escaping (ObjectResponse<Update>?, ErrorResponse?) -> Void) {

    Request(endpoint: "/api/v1/updates/iOS/\(GlobalConfig.shared.app.getSDKVersion())")
      .sendAsync { response in

        guard let data = response.data, response.isSuccess else {
          completionHandler(nil, try? ErrorFactory.decodeError(from: response))
          logError(response.error)
          return
        }

        do {
          let updateObject = try JSONDecoder().decode(ObjectResponse<Update>.self, from: data)
          completionHandler(updateObject, nil)
        }
        catch let error as NSError {
          completionHandler(nil, try? ErrorFactory.decodeError(from: response))
          logError(error)
        }
      }
  }
}
