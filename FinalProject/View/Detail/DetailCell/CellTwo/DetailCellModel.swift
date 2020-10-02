//
//  DetailCellModel.swift
//  FinalProject
//
//  Created by PCI0001 on 9/22/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class DetailCellModel {

    // MARK: - Properties
    var country: Country
    var nameCountry: String {
        return country.countryName
    }
    var confirmed: Int {
        return country.totalconfirmed
    }
    var deadth: Int {
        return country.totalDeaths
    }
    var recovered: Int {
        return country.totalRecovered
    }

    var active: Int {
        return confirmed - deadth - recovered
    }
    var date: String {
        return country.date
    }
    var deadRate: Float {
        if confirmed == 0 {
            return 0
        } else {
            return Float(Float(deadth) / Float(confirmed)) * 100
        }
    }
    var recoverRate: Float {
        if confirmed == 0 {
            return 0
        } else {
            return Float(Float(recovered) / Float(confirmed)) * 100
        }
    }
    var activeRate: Float {
        return 100 - deadRate - recoverRate
    }
    // MARK: - Initial
    init(country: Country = Country()) {
        self.country = country
    }
}
