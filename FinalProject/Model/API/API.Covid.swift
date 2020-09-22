//
//  API.Covid.swift
//  FinalProject
//
//  Created by PCI0001 on 9/21/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

extension Api.Path.Search {

    struct GetUrlString {
        func getUrlString() -> String {
            return Api.Path.CovidPath.baseURL + Api.Path.CovidPath.summaryURL
        }
    }

    static func getAllDataInSearch(completion: @escaping CompletionResult<[Country]>) {
        let urlString = GetUrlString().getUrlString()
        api.request(method: .get, urlString: urlString) { (result) in
            switch result {
            case .success(let data):
                if let data = data as? JSObject, let countries = data["Countries"] as? JSArray {
                    let array: [Country] = Mapper<Country>().mapArray(JSONArray: countries)
                    if !array.isEmpty {
                        completion( .success(array))
                    } else {
                        completion( .failure(Api.Error.emptyData))
                    }
                } else {
                    completion( .failure(Api.Error.emptyData))
                }
            case .failure(let error):
                completion( .failure(error))
            }
        }
    }
}
