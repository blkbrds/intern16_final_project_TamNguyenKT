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
    @IBOutlet private weak var newCasesLabel: UILabel!
    @IBOutlet private weak var newDeathsLabel: UILabel!
    @IBOutlet private weak var newRecoveredLabel: UILabel!
    @IBOutlet private weak var newActiveLabel: UILabel!
    // MARK: - Properties
    var viewModel: DetailCellModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - Private methods
    private func updateView() {
        guard let cases = viewModel?.newConfirmed else { return }
        newCasesLabel.text = String(cases)
        guard let deaths = viewModel?.newDeadth else { return }
        newDeathsLabel.text = String(deaths)
        guard let recovered = viewModel?.newRecovered else { return }
        newRecoveredLabel.text = String(recovered)
        guard let active = viewModel?.newActive else { return }
        newActiveLabel.text = String(active)
    }
}
