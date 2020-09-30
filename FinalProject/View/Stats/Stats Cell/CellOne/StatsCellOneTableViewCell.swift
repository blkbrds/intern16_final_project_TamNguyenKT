//
//  StatsCellOneTableViewCell.swift
//  FinalProject
//
//  Created by PCI0001 on 9/24/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class StatsCellOneTableViewCell: UITableViewCell {

    // MARK: - IBOulets
    @IBOutlet private weak var numberConfirmed: UILabel!
    @IBOutlet private weak var numberDeadth: UILabel!
    @IBOutlet private weak var numberRecovered: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!

    // MARK: - Properties
    var viewModel: StatsCellOneModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - Private methods
    private func updateView() {
        if let confirm = viewModel?.confirmed {
            numberConfirmed.text = String(confirm)
        }
        if let deadth = viewModel?.deadth {
            numberDeadth.text = String(deadth)
        }
        if let recover = viewModel?.recovered {
            numberRecovered.text = String(recover)
        }
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .medium
        dateLabel.text = dateFormatter.string(from: currentDate)
    }
}
