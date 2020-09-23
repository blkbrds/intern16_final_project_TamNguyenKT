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
    var lastItem: DayOneCountry
    var totalCase: Int = 0
    var totalRecovered: Int = 0
    var totalDeath: Int = 0
    var cellOne: Country

    // MARK: - Initial
init(title: String = "", codeCountry: String = "", lastItem: DayOneCountry = DayOneCountry(), totalCase: Int = 0, totalRecovered: Int = 0, totalDeath: Int = 0, cellOne: Country = Country()) {
        self.title = title
        self.codeCountry = codeCountry
        self.lastItem = lastItem
        self.totalCase = totalCase
        self.totalDeath = totalDeath
        self.totalRecovered = totalRecovered
        self.cellOne = cellOne
    }

    // MARK: - Function
    func getData(completion: @escaping APICompletion) {
        let urlString = Api.Path.Detail.path + codeCountry
        Api.Path.Detail.getDataCellOne(urlString: urlString) { result in
            switch result {
            case .failure(let error):
                completion( .failure(error))
            case .success(let result):
                self.lastItem = result
                completion( .success)
            }
        }
    }

    func numberOfRowInSection() -> Int {
        return 3
    }

    func viewModelForCirceChart(at indexPath: IndexPath) -> DetailCellModel {
        let viewModel = DetailCellModel(country: cellOne)
        return viewModel
    }

    func viewModelForCellOne(at indexPath: IndexPath) -> CellOneCellModel {
        let item = cellOne
        let viewModel = CellOneCellModel(cellOne: item)
        return viewModel
    }
}
