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

    var deadthRate: Double {
        return (Double(deadth) / Double(confirmed)) * 100
    }

    var recoverRate: Double {
        return (Double(recovered) / Double(confirmed)) * 100
    }

    var activeRate: Double {
        return 100 - deadthRate - recoverRate
    }

    // MARK: - Initial
    init(country: Country = Country()) {
        self.country = country
    }
}
