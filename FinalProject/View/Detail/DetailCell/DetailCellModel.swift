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
    var newConfirmed: Int? {
        return country.newConfirmed
    }
    var newDeadth: Int? {
        return country.newDeaths
    }
    var newRecovered: Int? {
        return country.newRecovered
    }

    // MARK: - Initial
    init(country: Country) {
        self.country = country
    }
}
