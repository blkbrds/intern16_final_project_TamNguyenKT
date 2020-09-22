//
//  Global.swift
//  FinalProject
//
//  Created by PCI0001 on 9/17/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation
import ObjectMapper

final class Global: Mappable {

    // MARK: - Properties
    var newConfirmed: Int?
    var totalconfirmed: Int?
    var newDeaths: Int?
    var totalDeaths: Int?
    var newRecovered: Int?
    var totalRecovered: Int?

    // MARK: - Initial
    init?(map: Map) {
    }

    // MARK: - Functions
    func mapping(map: Map) {
        newConfirmed <- map["NewConfirmed"]
        totalconfirmed <- map["Totalconfirmed"]
        newDeaths <- map["NewDeaths"]
        totalDeaths <- map["TotalDeaths"]
        newRecovered <- map["NewRecovered"]
        totalRecovered <- map["TotalRecovered"]
    }
}
