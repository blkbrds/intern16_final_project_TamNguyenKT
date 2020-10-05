//
//  StatsViewModel.swift
//  FinalProject
//
//  Created by PCI0001 on 9/24/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

enum RowType: Int {
    case statsWorld
    case chartWorld
    case statsVN
    case chartVN
    case rank
    var size: Int {
        switch self {
        case .statsWorld:
            return 100
        case .chartWorld:
            return 170
        case .statsVN:
            return 120
        case .chartVN:
            return 170
        case .rank:
            return 50
        }
    }
}

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
                this.itemVN = this.getItemVN()
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
                this.rankCountries = this.countries.sorted { $0.totalconfirmed > $1.totalconfirmed }
                completion( .success)
            }
        }
    }

    func getItemVN() -> Country {
        for index in 0 ..< countries.count where countries[index].countryName == "Viet Nam" {
            return countries[index]
        }
        return Country()
    }

    func numberOfRowInsection() -> Int {
        return 15
    }

    func viewModelForCellOne(at indexPath: IndexPath) -> WorldStatsCellModel {
        let viewModel = WorldStatsCellModel(cellOne: item)
        return viewModel
    }

    func viewModelForCellThree(at indexPath: IndexPath) -> VNStatsCellModel {
        let viewModel = VNStatsCellModel(country: itemVN)
        return viewModel
    }

    func viewModelForCellRank(at indexPath: IndexPath) -> RankCellModel {
        guard let item = rankCountries[safe: indexPath.row - 5] else { return RankCellModel() }
        let viewModel = RankCellModel(rankItem: item, index: indexPath.row - 4)
        return viewModel
    }

    func getRankCountry(at indexPath: IndexPath) -> DetailViewModel {
        let item = rankCountries[indexPath.row - 5]
        let detail = DetailViewModel(title: item.countryName,
                                     codeCountry: item.countryCode,
                                     totalCase: item.totalconfirmed,
                                     totalRecovered: item.totalRecovered,
                                     totalDeath: item.totalDeaths,
                                     cellOne: item,
                                     date: item.date)
        return detail
    }
}
