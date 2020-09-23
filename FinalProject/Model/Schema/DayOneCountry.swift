//
//  DayOneCountry.swift
//  FinalProject
//
//  Created by PCI0001 on 9/22/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation
import ObjectMapper

final class DayOneCountry: Mappable {

    // MARK: - Properties
    var country: String?
    var lat: Int?
    var lon: Int?
    var confirmed: Int?
    var deaths: Int?
    var recovered: Int?
    var active: Int?

    // MARK: - Initial
    init?(map: Map) {
    }

    init() {}

    func mapping(map: Map) {
        country <- map["Country"]
        lat <- map["Lat"]
        lon <- map["Lon"]
        confirmed <- map["Confirmed"]
        deaths <- map["Deaths"]
        recovered <- map["Recovered"]
        active <- map["Active"]
    }

//    var deathRate: Double {
//        return (Double(deaths) / Double(confirmed)) * 100
//    }
//    var recoverRate: Double {
//        return (Double(recovered) / Double(confirmed)) * 100
//    }
//    var activeRate: Double {
//        return Double()
//    }
}
