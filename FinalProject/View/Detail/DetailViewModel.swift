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
    var dayOneCountries: [DayOneCountry] = []
    var confirmedInCharts: [DayOneCountry] = []
    var deadthInCharts: [DayOneCountry] = []
    var cellOne: Country

    // MARK: - Initial
    init(dayOneCountries: [DayOneCountry] = [], cellOne: Country = Country()) {
        self.dayOneCountries = dayOneCountries
        self.cellOne = cellOne
    }

    // MARK: - Function
    func getDataInDetail(completion: @escaping APICompletion) {
        let urlString = Api.Path.Detail.path + cellOne.countryCode
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
