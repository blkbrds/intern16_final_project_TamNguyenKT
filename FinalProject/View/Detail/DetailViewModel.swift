//
//  DetailViewModel.swift
//  FinalProject
//
//  Created by PCI0001 on 9/22/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class DetailViewModel {

    // MARK: - Properties
    var title: String = ""
    var codeCountry: String = ""
    var dayOneCountries: [DayOneCountry] = []
    var confirmedInCharts: [DayOneCountry] = []
    var deadthInCharts: [DayOneCountry] = []
    var totalCase: Int = 0
    var totalRecovered: Int = 0
    var totalDeath: Int = 0
    var cellOne: Country
    var date: String = ""

    // MARK: - Initial
    init(title: String = "",
         codeCountry: String = "",
         dayOneCountries: [DayOneCountry] = [],
         totalCase: Int = 0,
         totalRecovered: Int = 0,
         totalDeath: Int = 0,
         cellOne: Country = Country(),
         date: String = "") {
        self.title = title
        self.codeCountry = codeCountry
        self.dayOneCountries = dayOneCountries
        self.totalCase = totalCase
        self.totalDeath = totalDeath
        self.totalRecovered = totalRecovered
        self.cellOne = cellOne
        self.date = date
    }

    // MARK: - Function
    func getDataInDetail(completion: @escaping APICompletion) {
        let urlString = Api.Path.Detail.path + codeCountry
        Api.Path.Detail.getDataInDetail(urlString: urlString) { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .failure(let error):
                completion( .failure(error))
            case .success(let result):
                this.dayOneCountries = result
                this.confirmedInCharts = this.getItemInChart()
                this.deadthInCharts = this.getItemInChart()
                completion( .success)
            }
        }
    }

    func getItemInChart() -> [DayOneCountry] {
        var items: [DayOneCountry] = []
        for index in dayOneCountries.count - 100 ..< dayOneCountries.count {
            items.append(dayOneCountries[index])
        }
        return items
    }

    func numberOfRowInSection() -> Int {
        return 4
    }

    func viewModelForCirceChart(at indexPath: IndexPath) -> DetailCellModel {
        let viewModel = DetailCellModel(country: cellOne)
        return viewModel
    }

    func viewModelForCellOne(at indexPath: IndexPath) -> CellOneCellModel {
        let viewModel = CellOneCellModel(cellOne: cellOne)
        return viewModel
    }

    func viewModelForCellTwo(at indexPath: IndexPath) -> DetailCellModel {
        let viewModel = DetailCellModel(country: cellOne)
        return viewModel
    }

    func viewModelForConfirmedChart(at indexPath: IndexPath) -> CellThreeCellModel {
        let viewModel = CellThreeCellModel(dayOneCountries: confirmedInCharts)
        return viewModel
    }

    func viewModelForDeadthChart(at indexPath: IndexPath) -> CellFourCellModel {
        let viewModel = CellFourCellModel(dayOneCountries: deadthInCharts)
        return viewModel
    }
}
