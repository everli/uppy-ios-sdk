//
//  UpdateService.swift
//  Uppy
//
//  Created by Arpit Williams on 02/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation

class UpdateService {

  func checkUpdates(for updateRequest: UpdateRequest,
                    with completionHandler: @escaping (ObjectResponse<Update>?, ErrorResponse?) -> Void) {

    let updatesApi = "/api/v2/applications/\(GlobalConfig.shared.applicationID)/updates/iOS"

    Request(endpoint: updatesApi, method: .POST, bodyParams: updateRequest.dictionary).sendAsync { response in

      guard let data = response.data, response.isSuccess else {
        completionHandler(nil, try? ErrorFactory.decodeError(from: response))
        logError(response.error)
        return
      }

      do {
        let updateObject = try JSONDecoder().decode(ObjectResponse<Update>.self, from: data)
        completionHandler(updateObject, nil)
      }
      catch {
        completionHandler(nil, try? ErrorFactory.decodeError(from: response))
      }
    }
  }
}
