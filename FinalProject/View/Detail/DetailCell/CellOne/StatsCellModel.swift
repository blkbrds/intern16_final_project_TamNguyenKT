//
//  CellOneCellModel.swift
//  FinalProject
//
//  Created by PCI0001 on 9/23/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class StatsCellModel {

    // MARK: - Properties
    var cellOne: Country
    var cases: Int {
        return cellOne.newConfirmed
    }
    var deadth: Int {
        return cellOne.newDeaths
    }
    var recover: Int {
        return cellOne.newRecovered
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
            return Float(Float(recover) / Float(cases)) * 100
        }
    }
    var activeRate: Float {
        return 100 - deadRate - recoverRate
    }

    // MARK: - Initial
    init(cellOne: Country) {
        self.cellOne = cellOne
    }
}
