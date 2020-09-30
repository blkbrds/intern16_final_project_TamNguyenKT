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
        Api.Path.Stats.getDataCellThree{ [weak self] result in
            guard let this = self else { return }
            switch result {
            case .failure(let error):
                completion( .failure(error))
            case .success(let result):
                this.countries = result
                this.itemVN = getVietNam()
                completion( .success)
            }
        }

        func getVietNam() -> Country {
            for index in 0 ..< countries.count {
                if countries[index].countryName == "Viet Nam" {
                    return countries[index]
                }
            }
            return Country()
        }
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
}
