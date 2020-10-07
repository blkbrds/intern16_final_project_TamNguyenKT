//
//  CellFourCellModel.swift
//  FinalProject
//
//  Created by PCI0001 on 10/2/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class DeadthChartCellModel {

    // MARK: Properties
    var cellFour: DayOneCountry
    var date: String {
        return cellFour.date
    }
    var deadth: Int {
        return cellFour.deaths
    }
    var dayOneCountries: [DayOneCountry] = []
    var deadthDayOneCountries: [Int] = []
    var dateCountries: [String] = []
    var dateInDeadthChart: Date = Date()

    // MARK: - Initial
    init(cellFour: DayOneCountry = DayOneCountry(), dayOneCountries: [DayOneCountry] = []) {
        self.cellFour = cellFour
        self.dayOneCountries = dayOneCountries
    }
}
