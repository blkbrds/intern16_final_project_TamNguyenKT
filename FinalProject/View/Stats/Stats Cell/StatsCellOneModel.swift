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

    // MARK: - Initial
    init(cellOne: Global) {
        self.cellOne = cellOne
    }
}
