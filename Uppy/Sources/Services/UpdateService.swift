//
//  UpdateService.swift
//  Uppy
//
//  Created by Arpit Williams on 02/07/20.
//  Copyright © 2020 Everli. All rights reserved.
//

import Foundation

class UpdateService {

  func checkUpdates(for appVersion: String, with completionHandler: @escaping (ObjectResponse<Update>?, ErrorResponse?) -> Void) {

    // @Arpit: Remove test data
    let mockData = "{ \"forced\" : true, \"download_url\" : \"https://www.google.com/\", \"version\" : \"1.0.0\" }"
    guard let data = mockData.data(using: .utf8), let update = try? JSONDecoder().decode(Update.self, from: data) else { return }
    completionHandler(ObjectResponse(data: update), nil)

    // @Arpit: Uncomment code onces api is on staging
//    Request(endpoint: "/api/v1/updates/iOS/\(appVersion)")
//      .sendAsync { response in
//
//        guard let data = response.data, response.isSuccess else {
//          completionHandler(nil, try? ErrorFactory.decodeError(from: response))
//          logError(response.error)
//          return
//        }
//
//        do {
//          let updateObject = try JSONDecoder().decode(ObjectResponse<Update>.self, from: data)
//          completionHandler(updateObject, nil)
//        }
//        catch let error as NSError {
//          completionHandler(nil, try? ErrorFactory.decodeError(from: response))
//          logError(error)
//        }
//      }
  }
}
