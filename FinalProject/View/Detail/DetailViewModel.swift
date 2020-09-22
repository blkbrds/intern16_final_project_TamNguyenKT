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

    init(title: String = "", codeCountry: String = "", lastItem: DayOneCountry = DayOneCountry()) {
        self.title = title
        self.codeCountry = codeCountry
        self.lastItem = lastItem
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

    func viewModelForCirceChart(at indexPath: IndexPath) -> DetailCellModel {
        let item = lastItem
        let viewModel = DetailCellModel(dayOneCountry: item)
        return viewModel
    }
}
