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
    var totalConfirmed: Int = 0
    var totalDeaths: Int = 0
    var totalRecovered: Int = 0

    // MARK: - Initial
    init?(map: Map) { }

    init() { }

    // MARK: - Functions
    func mapping(map: Map) {
        totalConfirmed <- map["TotalConfirmed"]
        totalDeaths <- map["TotalDeaths"]
        totalRecovered <- map["TotalRecovered"]
    }
}
