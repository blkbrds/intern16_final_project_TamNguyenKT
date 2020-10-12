//
//  DetailViewModel.swift
//  FinalProject
//
//  Created by PCI0001 on 9/22/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation
import MVVM
import RealmSwift

enum RowTypeInDetail: Int {
    case statsCountry
    case circleChart
    case caseChart
    case deadthChart

    var size: Int {
        switch self {
        case .statsCountry:return 190
        case .circleChart:return 160
        case .caseChart:return 280
        case .deadthChart:return 280
        }
    }
}

final class DetailViewModel: ViewModel {

    // MARK: - Properties
    var dayOneCountries: [DayOneCountry] = []
    var confirmedInCharts: [DayOneCountry] = []
    var deadthInCharts: [DayOneCountry] = []
    var cellOne: Country
    let dataInRealm: Country

    // MARK: - Initial
    init(dayOneCountries: [DayOneCountry] = [], cellOne: Country = Country(), dataInRealm: Country = Country()) {
        self.dayOneCountries = dayOneCountries
        self.cellOne = cellOne
        self.dataInRealm = dataInRealm
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
        for index in dayOneCountries.count - 20 ..< dayOneCountries.count {
            items.append(dayOneCountries[index])
        }
        return items
    }

    func numberOfItems(inSection section: Int) -> Int {
        return 4
    }

    func viewModelForCirceChart(at indexPath: IndexPath) -> DetailCellModel {
        let viewModel = DetailCellModel(country: cellOne)
        return viewModel
    }

    func viewModelForCellOne(at indexPath: IndexPath) -> StatsCellModel {
        let viewModel = StatsCellModel(cellOne: cellOne)
        return viewModel
    }

    func viewModelForCellTwo(at indexPath: IndexPath) -> DetailCellModel {
        let viewModel = DetailCellModel(country: cellOne)
        return viewModel
    }

    func viewModelForConfirmedChart(at indexPath: IndexPath) -> ConfirmChartCellModel {
        let viewModel = ConfirmChartCellModel(dayOneCountries: confirmedInCharts)
        return viewModel
    }

    func viewModelForDeadthChart(at indexPath: IndexPath) -> DeadthChartCellModel {
        let viewModel = DeadthChartCellModel(dayOneCountries: deadthInCharts)
        return viewModel
    }

    func checkFollow() -> Bool {
        do {
            let realm = try Realm()
            let results = realm.objects(Country.self).filter("countryCode = '\(dataInRealm.countryCode)'")
            if results.isEmpty {
                return false
            } else {
                return true
            }
        } catch {
            return false
        }
    }

    func handleRealm() -> Bool {
        do {
            if !checkFollow() {
                let realm = try Realm()
                let country = Country()
                country.countryName = "\(dataInRealm.countryName)"
                country.countryCode = "\(dataInRealm.countryCode)"
                country.totalconfirmed = dataInRealm.totalconfirmed
                country.totalDeaths = dataInRealm.totalDeaths
                country.totalRecovered = dataInRealm.totalRecovered
                try realm.write {
                    realm.add(country)
                }
                return true
            } else {
                let realm = try Realm()
                let country = realm.objects(Country.self).filter("countryCode = '\(self.dataInRealm.countryCode)'")
                try realm.write {
                    realm.delete(country)
                }
                return false
            }
        } catch {
            return false
        }
    }
}
