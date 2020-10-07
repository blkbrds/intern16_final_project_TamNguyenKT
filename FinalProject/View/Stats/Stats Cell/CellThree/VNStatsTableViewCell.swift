//
//  StatsCellThreeTableViewCell.swift
//  FinalProject
//
//  Created by PCI0001 on 9/29/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class VNStatsTableViewCell: UITableViewCell {

    // MARK: - IBOulets
    @IBOutlet private weak var totalCases: UILabel!
    @IBOutlet private weak var totalRecovered: UILabel!
    @IBOutlet private weak var totalDeadth: UILabel!
    @IBOutlet private weak var newCases: UILabel!
    @IBOutlet private weak var newRecovered: UILabel!
    @IBOutlet private weak var newDeadth: UILabel!

    // MARK: - Properties
    var viewModel: VNStatsCellModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - Private methods
    private func updateView() {
        guard let viewModel = viewModel else { return }
        totalCases.text = "\(viewModel.cases)"
        totalRecovered.text = "\(viewModel.recovered)"
        totalDeadth.text = "\(viewModel.deadth)"
        newCases.text = "\(viewModel.newCase)"
        newRecovered.text = "\(viewModel.newRecovered)"
        newDeadth.text = "\(viewModel.newDeadth)"
    }
}
