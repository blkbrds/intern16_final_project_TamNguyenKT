//
//  StatsCellOneTableViewCell.swift
//  FinalProject
//
//  Created by PCI0001 on 9/24/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class WorldStatsTableViewCell: UITableViewCell {

    // MARK: - IBOulets
    @IBOutlet private weak var numberConfirmed: UILabel!
    @IBOutlet private weak var numberDeadth: UILabel!
    @IBOutlet private weak var numberRecovered: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!

    // MARK: - Properties
    let currentDate = Date()
    var viewModel: WorldStatsCellModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - Private methods
    private func updateView() {
        if let confirm = viewModel?.confirmed {
            numberConfirmed.text = "\(confirm)"
        }
        if let deadth = viewModel?.deadth {
            numberDeadth.text = "\(deadth)"
        }
        if let recover = viewModel?.recovered {
            numberRecovered.text = "\(recover)"
        }
        dateLabel.text = DateFormatter.dateFormatter().string(from: currentDate)
    }
}
