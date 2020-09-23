//
//  Country.swift
//  FinalProject
//
//  Created by PCI0001 on 9/17/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation
import ObjectMapper

final class Country: Mappable {

    // MARK: - Properties
    var countryName: String = ""
    var countryCode: String = ""
    var newConfirmed: Int = 0
    var totalconfirmed: Int = 0
    var newDeaths: Int = 0
    var totalDeaths: Int = 0
    var newRecovered: Int = 0
    var totalRecovered: Int = 0

    // MARK: - Initial
    init?(map: Map) { }

    init() { }
    
    // MARK: - Function
    func mapping(map: Map) {
        countryName <- map["Country"]
        countryCode <- map["CountryCode"]
        newConfirmed <- map["NewConfirmed"]
        totalconfirmed <- map["TotalConfirmed"]
        newDeaths <- map["NewDeaths"]
        totalDeaths <- map["TotalDeaths"]
        newRecovered <- map["NewRecovered"]
        totalRecovered <- map["TotalRecovered"]
    }
}
