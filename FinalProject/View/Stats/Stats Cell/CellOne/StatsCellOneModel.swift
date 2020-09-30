//
//  StatsCellOneModel.swift
//  FinalProject
//
//  Created by PCI0001 on 9/24/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class StatsCellOneModel {

    // MARK: - Properties
    var cellOne: Global
    var confirmed: Int {
        return cellOne.totalConfirmed
    }
    var deadth: Int {
        return cellOne.totalDeaths
    }
    var recovered: Int {
        return cellOne.totalRecovered
    }
    var deadRate: Float {
        if confirmed == 0 {
            return 0
        } else {
        return Float(Float(deadth) / Float(confirmed)) * 100
        }
    }
    var recoverRate: Float {
        if confirmed == 0 {
            return 0
        } else {
        return Float(Float(recovered) / Float(confirmed)) * 100
        }
    }
    var activeRate: Float {
        return 100 - deadRate - recoverRate
    }

    // MARK: - Initial
    init(cellOne: Global) {
        self.cellOne = cellOne
    }
}
