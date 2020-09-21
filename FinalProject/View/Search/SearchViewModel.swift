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
        Api.Path.Search.getAllDataInSearch() { (result) in
            switch result {
            case .failure(let error):
                completion( .failure(error))
            case .success(let result):
                self.countries.append(contentsOf: result)
                self.filter = self.countries
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
}
