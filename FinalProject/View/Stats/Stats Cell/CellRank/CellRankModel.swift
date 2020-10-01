//
//  CellRankModel.swift
//  FinalProject
//
//  Created by PCI0001 on 9/30/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import Foundation

final class RankCellModel {
    var rankItem: Country
    var nameCountry: String {
        return rankItem.countryName
    }
    var totalCases: Int {
        return rankItem.totalconfirmed
    }
    var index: Int = 0

    // MARK: - Initial
    init(rankItem: Country = Country(), index: Int = 0) {
        self.rankItem = rankItem
        self.index = index
    }
}
