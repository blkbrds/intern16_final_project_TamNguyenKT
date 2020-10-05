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
    var item: [DayOneCountry] = []
    var cellOne: Country = Country()

    // MARK: - Initial
    init(item: [DayOneCountry] = [],
         cellOne: Country = Country()) {
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
                this.item = result
                completion( .success)
            }
        }
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
}
