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
    @IBOutlet private weak var followButton: UIButton!

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
        if let numberCase = viewModel?.totalConfirmed {
            numbercaseLabel.text = String(numberCase)
        }
        if let numberDeadth = viewModel?.totalDeadth {
            numberDeadthLabel.text = String(numberDeadth)
        }
        if let numberRecovered = viewModel?.totalRecovered {
            numberRecoveredLabel.text = String(numberRecovered)
        }
    }

    @IBAction private func followButtonTouchUpInside(_ sender: UIButton) {
        //TODO: - Handle Realm
    }
}
