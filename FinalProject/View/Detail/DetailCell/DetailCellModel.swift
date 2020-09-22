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
    var dayOneCountry: DayOneCountry
    var newConfirmed: Int? {
        return dayOneCountry.confirmed
    }
    var newDeadth: Int? {
        return dayOneCountry.deaths
    }
    var newRecovered: Int? {
        return dayOneCountry.recovered
    }

    var newActive: Int? {
        return dayOneCountry.active
    }

    // MARK: - Initial
    init(dayOneCountry: DayOneCountry) {
        self.dayOneCountry = dayOneCountry
    }
}
