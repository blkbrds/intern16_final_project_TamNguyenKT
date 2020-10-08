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
    var cellFourCountry: DayOneCountry
    var date: String {
        return cellFourCountry.date
    }
    var deadth: Int {
        return cellFourCountry.deaths
    }
    var dayOneCountriesInChart: [DayOneCountry] = []
    var deadthDayOneCountries: [Int] = []
    var dateCountries: [String] = []
    var dateInDeadthChart: Date = Date()

    // MARK: - Initial
    init(cellFour: DayOneCountry = DayOneCountry(), dayOneCountries: [DayOneCountry] = []) {
        cellFourCountry = cellFour
        dayOneCountriesInChart = dayOneCountries
    }
}
