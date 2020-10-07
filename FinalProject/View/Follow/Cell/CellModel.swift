//
//  CellModel.swift
//  FinalProject
//
//  Created by PCI0001 on 10/6/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation
import RealmSwift

final class CellModel {

    // MARK: - Propeties
    var item: Country
    var nameCountry: String {
        return item.countryName
    }
    var totalCase: Int {
        return item.totalconfirmed
    }
    var totalRecover: Int {
        return item.totalRecovered
    }
    var totalDeadth: Int {
        return item.totalDeaths
    }
    var countryCode: String {
        return item.countryCode
    }

    // MARK: - Initial
    init(item: Country = Country()) {
        self.item = item
    }

    func deleteFollowItem(completion: @escaping APICompletion) {
        do {
            let realm = try Realm()
            let result = realm.objects(Country.self).filter("countryCode = '\(item.countryCode)'")
            try realm.write {
                realm.delete(result)
            }
            completion(.success)
        } catch {
            completion(.failure(error))
        }
    }
}
