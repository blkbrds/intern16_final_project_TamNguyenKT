//
//  SearchTableViewCell.swift
//  FinalProject
//
//  Created by PCI0001 on 9/17/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

protocol SearchTableViewCellDelegate: class {
    func view(view: SearchTableViewCell, needPerform action: SearchTableViewCell.Action)
}

final class SearchTableViewCell: UITableViewCell {

    enum Action {
        case follow(isFollow: Bool)
    }

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
    weak var delegate: SearchTableViewCellDelegate?

    // MARK: - Private methods
    private func updateView() {

        countryNameLabel.text = viewModel?.countryName
        countryCodeLabel.text = viewModel?.countryCode
        if let numberCase = viewModel?.totalConfirmed {
            numbercaseLabel.text = "\(numberCase)"
        }
        if let numberDeadth = viewModel?.totalDeadth {
            numberDeadthLabel.text = "\(numberDeadth)"
        }
        if let numberRecovered = viewModel?.totalRecovered {
            numberRecoveredLabel.text = "\(numberRecovered)"
        }
        if let isFollow = viewModel?.isFollow {
            followButton.isSelected = isFollow
        }
    }

    @IBAction private func followButtonTouchUpInside(_ sender: UIButton) {
        delegate?.view(view: self, needPerform: .follow(isFollow: followButton.isSelected))
    }
}
