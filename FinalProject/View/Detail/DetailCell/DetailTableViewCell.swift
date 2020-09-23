//
//  DetailTableViewCell.swift
//  FinalProject
//
//  Created by PCI0001 on 9/22/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class DetailTableViewCell: UITableViewCell {

    // MARK: - IBOulets
//    @IBOutlet private weak var newCasesLabel: UILabel!
//    @IBOutlet private weak var newDeathsLabel: UILabel!
//    @IBOutlet private weak var newRecoveredLabel: UILabel!
//    @IBOutlet private weak var newActiveLabel: UILabel!

    // MARK: - Properties
    var viewModel: DetailCellModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - Private methods
    private func updateView() {
        guard let viewModel = viewModel else { return }
//        newCasesLabel.text = String(viewModel.confirmed)
//        newDeathsLabel.text = String(viewModel.deadth)
//        newRecoveredLabel.text = String(viewModel.recovered)
//        newActiveLabel.text = String(viewModel.active)
    }
}
