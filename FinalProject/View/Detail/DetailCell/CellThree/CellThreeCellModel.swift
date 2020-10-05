//
//  CellThreeCellModel.swift
//  FinalProject
//
//  Created by PCI0001 on 10/1/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class CellThreeCellModel {

    // MARK: Properties
    var cellThree: DayOneCountry
    var date: String {
        return cellThree.date
    }
    var confirmed: Int {
        return cellThree.confirmed
    }
    var dayOneCountries: [DayOneCountry] = []
    var confirmedDayOneCountries: [Int] = []
    var dateInConfirmChart: Date = Date()

    // MARK: - Initial
    init(cellThree: DayOneCountry = DayOneCountry(), dayOneCountries: [DayOneCountry] = []) {
        self.cellThree = cellThree
        self.dayOneCountries = dayOneCountries
    }
}
