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

    // MARK: - Function

    func getDataCellOne(completion: @escaping APICompletion) {
        Api.Path.Stats.getDataCellOne() { [weak self] result in
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

    func numberOfRowInsection() -> Int {
        return 4
    }

    func viewModelForCellOne(at indexPath: IndexPath) -> StatsCellOneModel {
        let viewModel = StatsCellOneModel(cellOne: item)
        return viewModel
    }
}
