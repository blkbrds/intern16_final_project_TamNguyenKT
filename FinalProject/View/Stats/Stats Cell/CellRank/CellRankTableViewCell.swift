//
//  CellRankTableViewCell.swift
//  FinalProject
//
//  Created by PCI0001 on 9/30/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

class CellRankTableViewCell: UITableViewCell {

    // MARK: - IBOulets
    @IBOutlet private weak var nameCountry: UILabel!
    @IBOutlet private weak var totalCasesLabel: UILabel!
    @IBOutlet private weak var rankLabel: UILabel!

    // MARK: - Properties
    var viewModel: RankCellModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - Private methods
    private func updateView() {
        guard let viewModel = viewModel else { return }
        nameCountry.text = viewModel.nameCountry
        totalCasesLabel.text = String(viewModel.totalCases)
        rankLabel.text = String(viewModel.index) + "."
    }
}
