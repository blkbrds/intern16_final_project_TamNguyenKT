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
    var country: String = ""
    var lat: Double = 0.0
    var lon: Double = 0.0
    var confirmed: Int = 0
    var deaths: Int = 0
    var recovered: Int = 0
    var active: Int = 0
    var date: String = ""

    // MARK: - Initial
    init?(map: Map) { }

    init() { }

    func mapping(map: Map) {
        country <- map["Country"]
        lat <- map["Lat"]
        lon <- map["Lon"]
        confirmed <- map["Confirmed"]
        deaths <- map["Deaths"]
        recovered <- map["Recovered"]
        active <- map["Active"]
        date <- map["Date"]
    }
}
