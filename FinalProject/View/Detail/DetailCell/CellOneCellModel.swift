//
//  CellOneCellModel.swift
//  FinalProject
//
//  Created by PCI0001 on 9/23/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class CellOneCellModel {

    // MARK: - Properties
    var cellOne: Country
    var cases: Int? {
        return cellOne.newConfirmed
    }
    var deadth: Int? {
        return cellOne.newDeaths
    }
    var recover: Int? {
        return cellOne.newRecovered
    }

    // MARK: - Initial
    init(cellOne: Country) {
        self.cellOne = cellOne
    }
}

