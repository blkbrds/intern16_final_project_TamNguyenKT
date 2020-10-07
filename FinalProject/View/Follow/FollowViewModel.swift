//
//  FollowViewModel.swift
//  FinalProject
//
//  Created by PCI0001 on 10/6/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation
import RealmSwift

protocol FollowViewModelDelegate: class {

    func syncFollow(viewModel: FollowViewModel, needperformAction action: FollowViewModel.Action)
}

final class FollowViewModel {

    // MARK: - Properties
    enum Action {
        case reloadData
        case fail(Error)
    }
    var countriesInFollow: [Country] = []
    var isEmpty: Bool {
        return countriesInFollow.isEmpty
    }
    private var notificationToken: NotificationToken?
    weak var delegate: FollowViewModelDelegate?

    // MARK: - Function
    func setupObserve() {
        do {
            let realm = try Realm()
            notificationToken = realm.objects(Country.self).observe({ (_) in
                if let delegate = self.delegate {
                    delegate.syncFollow(viewModel: self, needperformAction: .reloadData)
                }
            })
        } catch {
            delegate?.syncFollow(viewModel: self, needperformAction: .fail(error))
        }
    }

    func fetchRealmData(completion: @escaping APICompletion) {
        do {
            let realm = try Realm()
            let results = realm.objects(Country.self)
            countriesInFollow = Array(results)
            completion(.success)
        } catch {
            completion(.failure(error))
        }
    }

    func deleteAllItem(completion: @escaping APICompletion) {
        do {
            let realm = try Realm()
            let results = realm.objects(Country.self)
            try realm.write {
                realm.delete(results)
            }
            completion(.success)
        } catch {
            completion(.failure(error))
        }
    }

    func deleteItemFollow(countryCode: String, completion: @escaping APICompletion) {
        do {
            let realm = try Realm()
            let result = realm.objects(Country.self).filter("countryCode = '\(countryCode)'")
            try realm.write {
                realm.delete(result)
            }
            completion(.success)
        } catch {
            completion(.failure(error))
        }
    }

    func numberOfRowInSection() -> Int {
        return countriesInFollow.count
    }

    func viewModelForFollowCell(at indexPath: IndexPath) -> CellModel {
        let item = countriesInFollow[indexPath.row]
        let viewModel = CellModel(item: item)
        return viewModel
    }

    func getCountryInFollow(at indexPath: IndexPath) -> DetailViewModel {
        let item = countriesInFollow[indexPath.row]
        let viewModel = DetailViewModel(cellOne: item)
        return viewModel
    }
}
