//
//  FollowCell.swift
//  FinalProject
//
//  Created by PCI0001 on 10/6/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

protocol FollowCellDelegate: class {
    func view(view: FollowCell, needPerforms action: FollowCell.Action)
}
final class FollowCell: UITableViewCell {

    // MARK: - IBOulets
    @IBOutlet private weak var nameCountryLabel: UILabel!
    @IBOutlet private weak var numberCaseLabel: UILabel!
    @IBOutlet private weak var numberRecoverLabel: UILabel!
    @IBOutlet private weak var numberDeadthLabel: UILabel!
    @IBOutlet private weak var countryCodeLabel: UILabel!
    @IBOutlet private weak var unfollowButton: UIButton!
    // MARK: - Properties
    enum Action {
        case delete
    }
    weak var delegate: FollowCellDelegate?
    var viewModel: CellModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - Private methods
    private func updateView() {
        guard let viewModel = viewModel else { return }
        nameCountryLabel.text = viewModel.nameCountry
        countryCodeLabel.text = viewModel.countryCode
        numberCaseLabel.text = "\(viewModel.totalCase)"
        numberDeadthLabel.text = "\(viewModel.totalDeadth)"
        numberRecoverLabel.text = "\(viewModel.totalRecover)"
    }

    // MARK: - IBActions
    @IBAction private  func unfollowButtonTouchUpInside(_ sender: UIButton) {
        delegate?.view(view: self, needPerforms: .delete)
    }
}
