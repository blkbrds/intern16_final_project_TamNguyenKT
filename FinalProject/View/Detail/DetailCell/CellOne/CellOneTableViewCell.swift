//
//  CellOneTableViewCell.swift
//  FinalProject
//
//  Created by PCI0001 on 9/23/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class CellOneTableViewCell: UITableViewCell {

    // MARK: - IBOulets
    @IBOutlet private weak var numberCaseLabel: UILabel!
    @IBOutlet private weak var numberRecoverLabel: UILabel!
    @IBOutlet private weak var numberDeadthLabel: UILabel!

    // MARK: - Properties
    var viewModel: CellOneCellModel? {
        didSet {
            updateView()
        }
    }
    // MARK: - Private methods
    private func updateView() {
        guard let cases = viewModel?.cases else { return }
        guard let recover = viewModel?.recover else { return }
        guard let deadth = viewModel?.deadth else { return }
        numberCaseLabel.text = "\(cases)"
        numberDeadthLabel.text = "\(deadth)"
        numberRecoverLabel.text = "\(recover)"
    }
}
