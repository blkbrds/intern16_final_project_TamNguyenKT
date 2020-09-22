//
//  SearchCellModel.swift
//  FinalProject
//
//  Created by PCI0001 on 9/17/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class SearchCellModel {

    // MARK: - Properties
    var country: Country
    var countryName: String? {
        return country.countryName
    }
    var totalConfirmed: Int? {
        return country.totalconfirmed
    }
    var totalDeadth: Int? {
        return country.totalDeaths
    }
    var totalRecovered: Int? {
        return country.totalRecovered
    }
    var countryCode: String? {
        return country.countryCode
    }

    // MARK: - Initial
    init(country: Country) {
        self.country = country
    }
}
