//
//  Country.swift
//  FinalProject
//
//  Created by PCI0001 on 9/17/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

final class Country: Object, Mappable {

    // MARK: - Properties
    @objc dynamic var countryName: String = ""
    @objc dynamic var countryCode: String = ""
    @objc dynamic var confirmNew: Int = 0
    @objc dynamic var totalconfirmed: Int = 0
    @objc dynamic var deadthNew: Int = 0
    @objc dynamic var totalDeaths: Int = 0
    @objc dynamic var recoverNew: Int = 0
    @objc dynamic var totalRecovered: Int = 0
    var date: String = ""
    var isFollow: Bool = false

    // MARK: - Initial
    required init?(map: Map) { }

    required init() { }

    init(countryName: String = "", countryCode: String = "", confirmNew: Int = 0, totalconfirmed: Int = 0, deadthNew: Int = 0, totalDeadths: Int = 0, recoverNew: Int = 0, totalRecovered: Int = 0) {
        self.countryName = countryName
        self.countryCode = countryCode
        self.confirmNew = confirmNew
        self.totalconfirmed = totalconfirmed
        self.deadthNew = deadthNew
        self.totalDeaths = totalDeadths
        self.recoverNew = recoverNew
        self.totalRecovered = totalRecovered
    }

    // MARK: - Function
    func mapping(map: Map) {
        countryName <- map["Country"]
        countryCode <- map["CountryCode"]
        confirmNew <- map["NewConfirmed"]
        totalconfirmed <- map["TotalConfirmed"]
        deadthNew <- map["NewDeaths"]
        totalDeaths <- map["TotalDeaths"]
        recoverNew <- map["NewRecovered"]
        totalRecovered <- map["TotalRecovered"]
        date <- map["Date"]
    }

    override static func primaryKey() -> String? {
        return "countryCode"
    }

    override static func ignoredProperties() -> [String] {
        return ["date"]
    }
}
