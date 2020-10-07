//
//  SearchViewModel.swift
//  FinalProject
//
//  Created by PCI0001 on 9/21/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation
import RealmSwift

protocol SearchViewModelDelegate: class {

    func syncFollow(view: SearchViewModel, needPerform action: SearchViewModel.Action)
}

final class SearchViewModel {

    // MARK: - Properties
    enum Action {
        case reloadData
        case fail(Error)
    }
    var countries: [Country] = []
    var filter: [Country] = []
    var notificationToken: NotificationToken?
    weak var delegate: SearchViewModelDelegate?

    // MARK: - Function

    func fetchRealmData(completion: @escaping APICompletion) {
        do {
            let realm = try Realm()
            let results = Array(realm.objects(Country.self))
            for item in countries {
                if results.contains(where: { $0.countryCode == item.countryCode }) {
                    item.isFollow = true
                }
            }
            completion(.success)
        } catch {
            completion(.failure(error))
        }
    }

    func addFollowIntem(index: Int, completion: @escaping APICompletion) {
        do {
            let realm = try Realm()
            let countriesInRealm = filter[index]
            let tempCountries = Country(countryName: countriesInRealm.countryName,
                                        countryCode: countriesInRealm.countryCode,
                                        confirmNew: countriesInRealm.confirmNew,
                                        totalconfirmed: countriesInRealm.totalconfirmed,
                                        deadthNew: countriesInRealm.deadthNew,
                                        totalDeadths: countriesInRealm.totalDeaths,
                                        recoverNew: countriesInRealm.recoverNew,
                                        totalRecovered: countriesInRealm.totalRecovered)
            try realm.write {
                realm.create(Country.self, value: tempCountries, update: .all)
            }
            completion(.success)
        } catch {
            completion(.failure(error))
        }
    }

    func unFollowItem(index: Int, completion: @escaping APICompletion) {
        do {
            let realm = try Realm()
            let country = filter[index]
            let result = realm.objects(Country.self).filter("countryCode = '\(country.countryCode )'")
            try realm.write {
                realm.delete(result)
            }
            completion(.success)
        } catch {
            completion(.failure(error))
        }
    }

    func setupObserver() {
        do {
            let realm = try Realm()
            notificationToken = realm.objects(Country.self).observe({ [weak self] changes in
                guard let this = self else { return }
                switch changes {
                case .update(let country, _, _, _):
                    for item in this.filter {
                        if country.contains(where: { $0.countryCode == item.countryCode }) {
                            item.isFollow = true
                        } else {
                            item.isFollow = false
                        }
                    }
                    this.delegate?.syncFollow(view: this, needPerform: .reloadData)
                case .error(let error):
                    this.delegate?.syncFollow(view: this, needPerform: .fail(error))
                default: break
                }
            })
        } catch {
            delegate?.syncFollow(view: self, needPerform: .fail(error))
        }
    }

    func getData(completion: @escaping APICompletion) {
        Api.Path.Search.getAllDataInSearch { [weak self] result in
            switch result {
            case .failure(let error):
                completion( .failure(error))
            case .success(let result):
                guard let this = self else { return }
                this.countries.append(contentsOf: result)
                this.filter = this.countries
                this.fetchRealmData(completion: completion)
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
        let detail = DetailViewModel(cellOne: item)
        return detail
    }
}
