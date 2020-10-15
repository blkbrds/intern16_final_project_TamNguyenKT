//
//  StatsCellThreeModel.swift
//  FinalProject
//
//  Created by PCI0001 on 9/29/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class VNStatsCellModel {

    // MARK: - Properties
    var country: Country
    var cases: Int {
        return country.totalconfirmed
    }
    var recovered: Int {
        return country.totalRecovered
    }
    var deadth: Int {
        return country.totalDeaths
    }
    var newCase: Int {
        return country.confirmNew
    }
    var newRecovered: Int {
        return country.recoverNew
    }
    var newDeadth: Int {
        return country.deadthNew
    }
    var deadRate: Float {
        if cases == 0 {
            return 0
        } else {
        return Float(Float(deadth) / Float(cases)) * 100
        }
    }
    var recoverRate: Float {
        if cases == 0 {
            return 0
        } else {
        return Float(Float(recovered) / Float(cases)) * 100
        }
    }
    var activeRate: Float {
        return 100 - deadRate - recoverRate
    }

    // MARK: - Initial
    init(country: Country = Country()) {
        self.country = country
    }
}
