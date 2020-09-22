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

    static func getAllDataInSearch(completion: @escaping CompletionResult<[Country]>) {
        let urlString = path
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

extension Api.Path.Detail {

        static func getDataCellOne(completion: @escaping CompletionResult<Country>) {
            let urlString = path
            api.request(method: .get, urlString: urlString) { (result) in
                
            }
        }
}
