//
//  CellRankTableViewCell.swift
//  FinalProject
//
//  Created by PCI0001 on 9/30/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

class CellRankTableViewCell: UITableViewCell {

    // MARK: - IBOulets
    @IBOutlet private weak var nameCountry: UILabel!
    @IBOutlet private weak var totalCasesLabel: UILabel!
    @IBOutlet private weak var rankLabel: UILabel!

    // MARK: - Properties
    var viewModel: RankCellModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - Override methods
    override func prepareForReuse() {
        super.prepareForReuse()
        self.subviews.forEach { (item) in
            if item.tag == 1 {
                item.removeFromSuperview()
            }
        }
    }

    // MARK: - Private methods
    private func updateView() {
        guard let viewModel = viewModel else { return }
        nameCountry.text = viewModel.nameCountry
        totalCasesLabel.text = String(viewModel.totalCases)
        rankLabel.text = String(viewModel.index) + "."

        let widthCircle: CGFloat = 100
        let circle = CircleGraphic(frame: CGRect(x: (self.width - widthCircle) / 3 - 85,
                                                 y: (self.height - widthCircle) / 3 + 20,
                                                 width: widthCircle, height: widthCircle),
                                   percent: Int(viewModel.rateActive), title: App.TitleInChart.active, color: #colorLiteral(red: 0.06033852696, green: 0.1071578935, blue: 0.2150699496, alpha: 1))
        circle.tag = 1
        self.addSubview(circle)

        let widthCircle1: CGFloat = 100
        let circle1 = CircleGraphic(frame: CGRect(x: (self.width - widthCircle1) / 3 + 55,
                                                  y: (self.height - widthCircle1) / 3 + 20,
                                                  width: widthCircle1, height: widthCircle1),
                                    percent: Int(viewModel.rateRecover), title: App.TitleInChart.recovered, color: #colorLiteral(red: 0.8921368718, green: 0.07753541321, blue: 0.4605419636, alpha: 1))
        circle1.tag = 1
        self.addSubview(circle1)

        let widthCircle2: CGFloat = 100
        let circle2 = CircleGraphic(frame: CGRect(x: (self.width - widthCircle2) / 3 + 195,
                                                  y: (self.height - widthCircle2) / 3 + 20,
                                                  width: widthCircle2, height: widthCircle2),
                                    percent: Int(viewModel.rateDeadth), title: App.TitleInChart.deadth, color: #colorLiteral(red: 0.01177123282, green: 0.786806643, blue: 0.9336950183, alpha: 1))
        circle2.tag = 1
        self.addSubview(circle2)
    }
}
