//
//  StatsViewModel.swift
//  FinalProject
//
//  Created by PCI0001 on 9/24/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class StatsViewModel {

    // MARK: - Properties
    var item: Global = Global()
    var countries: [Country] = []
    var rankCountries: [Country] = []
    var itemVN: Country = Country()

    // MARK: - Function

    func getDataCellOne(completion: @escaping APICompletion) {
        Api.Path.Stats.getDataCellOne { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .failure(let error):
                completion( .failure(error))
            case .success(let result):
                this.item = result
                completion( .success)
            }
        }
    }

    func getDataCellThree(completion: @escaping APICompletion) {
        Api.Path.Stats.getDataCellThree { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .failure(let error):
                completion( .failure(error))
            case .success(let result):
                this.countries = result
                this.itemVN = this.getVietNam()
                completion( .success)
            }
        }
    }

    func getDataCellRank(completion: @escaping APICompletion) {
        Api.Path.Stats.getDataCellRank { [weak self] result in
            switch result {
            case .failure(let error):
                completion( .failure(error))
            case .success(let result):
                guard let this = self else { return }
                this.countries = result
                this.rankCountries = this.countries
                this.rankCountries = this.countries.sorted { $0.totalconfirmed > $1.totalconfirmed }
                completion( .success)
            }
        }
    }

    func getVietNam() -> Country {
        for index in 0 ..< countries.count where countries[index].countryName == "Viet Nam" {
                return countries[index]
            }
        return Country()
    }

    func numberOfRowInsection() -> Int {
        return 20
    }

    func viewModelForCellOne(at indexPath: IndexPath) -> StatsCellOneModel {
        let viewModel = StatsCellOneModel(cellOne: item)
        return viewModel
    }

    func viewModelForCellThree(at indexPath: IndexPath) -> StatsCellThreeModel {
        let viewModel = StatsCellThreeModel(country: itemVN)
        return viewModel
    }

    func viewModelForCellRank(at indexPath: IndexPath) -> CellRankModel {
        guard let item = rankCountries[safe: indexPath.row - 5] else { return CellRankModel() }
        let viewModel = CellRankModel(rankItem: item, index: indexPath.row - 4)
        return viewModel
    }
}
