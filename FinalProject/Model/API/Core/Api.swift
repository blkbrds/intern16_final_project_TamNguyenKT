//
//  Api.swift
//  MyApp
//
//  Created by iOSTeam on 2/21/18.
//  Copyright © 2018 Asian Tech Co., Ltd. All rights reserved.
//

import Foundation
import  Alamofire

final class Api {

    struct Path {
        static let baseURL = "https://api.covid19api.com"
        static let summaryURL = "/summary"
        static let worldURL = "/world/total"
        static let countriesURL = "/countries"
        static let dayoneURL = "/dayone/country/"
    }

    struct Stats { }
    struct Search { }
    struct Detail { }
    struct Map {}
}

protocol URLStringConvertible {
    var urlString: String { get }
}

protocol ApiPath: URLStringConvertible {
    static var path: String { get }
}

extension URL: URLStringConvertible {
    var urlString: String { return absoluteString }
}

extension Int: URLStringConvertible {
    var urlString: String { return String(describing: self) }
}

private func / (lhs: URLStringConvertible, rhs: URLStringConvertible) -> String {
    return lhs.urlString + "/" + rhs.urlString
}

extension String: URLStringConvertible {
    var urlString: String { return self }
}

extension CustomStringConvertible where Self: URLStringConvertible {
    var urlString: String { return description }
}

extension Api.Path {

    struct Detail {
        static var path: String { return baseURL + dayoneURL }
    }

    struct Search {
        static var path: String { return baseURL + summaryURL }
    }
}
