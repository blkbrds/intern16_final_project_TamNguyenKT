//
//  SearchViewModel.swift
//  FinalProject
//
//  Created by PCI0001 on 9/21/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class SearchViewModel {

    // MARK: - Properties
    var countries: [Country] = []
    var filter: [Country] = []

    // MARK: - Function
    func getData(completion: @escaping APICompletion) {
        Api.Path.Search.getAllDataInSearch() { [weak self] result in
            switch result {
            case .failure(let error):
                completion( .failure(error))
            case .success(let result):
                guard let this = self else { return }
                this.countries.append(contentsOf: result)
                this.filter = this.countries
                completion( .success)
            }
        }
    }

    func numberOfRowInSection() -> Int {
        return filter.count
    }

    func viewModelForCell(at indexPath: IndexPath) -> SearchCellModel {
        let item = filter[indexPath.row]
        let viewModel = SearchCellModel(country: item)
        return viewModel
    }

    func getNameCountry(at indexPath: IndexPath) -> DetailViewModel {
        let item = filter[indexPath.row]
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
