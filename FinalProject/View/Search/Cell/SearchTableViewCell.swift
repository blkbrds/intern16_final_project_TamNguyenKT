//
//  SearchTableViewCell.swift
//  FinalProject
//
//  Created by PCI0001 on 9/17/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class SearchTableViewCell: UITableViewCell {

    // MARK: - IBOulets
    @IBOutlet private weak var countryNameLabel: UILabel!
    @IBOutlet private weak var countryCodeLabel: UILabel!
    @IBOutlet private weak var numbercaseLabel: UILabel!
    @IBOutlet private weak var numberDeadthLabel: UILabel!
    @IBOutlet private weak var numberRecoveredLabel: UILabel!
    
    // MARK: - Properties
    var viewModel: SearchCellModel? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Private methods
    private func updateView() {
        countryNameLabel.text = viewModel?.countryName
        countryCodeLabel.text = viewModel?.countryCode
        guard let numberCase = viewModel?.totalConfirmed else { return }
        numbercaseLabel.text = String(numberCase)
        guard let numberDeadth = viewModel?.totalDeadth else { return }
        numberDeadthLabel.text = String(numberDeadth)
        guard let numberRecovered = viewModel?.totalRecovered else { return }
        numberRecoveredLabel.text = String(numberRecovered)
    }
}
