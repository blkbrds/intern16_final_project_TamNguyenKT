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

    // MARK: - Initial
    init(country: Country) {
        self.country = country
    }
}
