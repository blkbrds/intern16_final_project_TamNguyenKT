//
//  ApiManager.swift
//  MyApp
//
//  Created by iOSTeam on 2/21/18.
//  Copyright © 2018 Asian Tech Co., Ltd. All rights reserved.
//

import Foundation
import Alamofire

typealias JSObject = [String: Any]
typealias JSArray = [JSObject]

typealias Completion = (Result<Any>) -> Void
typealias APICompleetion = (APIResult) -> Void

enum APIResult {
    case success
    case failure(Error)
}

// MARK: - Get error for api result
extension APIResult {
    
    var error: Error? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}
let api = ApiManager()

final class ApiManager {

    var defaultHTTPHeaders: [String: String] {
        let headers: [String: String] = [:]
        return headers
    }
}
