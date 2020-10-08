//
//  StatsCellTwoTableViewCell.swift
//  FinalProject
//
//  Created by PCI0001 on 9/29/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class WorldChartTableViewCell: UITableViewCell {

    // MARK: - Properties
    var viewModel: WorldStatsCellModel? {
        didSet {
            updateView()
        }
    }
    private var xStart: CGFloat = 20

    // MARK: - Override methods
    override func prepareForReuse() {
        super.prepareForReuse()
        subviews.forEach { item in
            item.removeFromSuperview()
        }
    }

    // MARK: - Private methods
    private func updateView() {
        let spaceChart: CGFloat = self.width / 8
        if let active = viewModel?.activeRate {
            let widthCircle: CGFloat = 90
            let circle = CircleGraphic(frame: CGRect(x: xStart,
                                                     y: (height - widthCircle) / 3,
                                                     width: widthCircle, height: widthCircle),
                                       percent: Int(active), title: App.TitleInChart.active, color: #colorLiteral(red: 0.06033852696, green: 0.1071578935, blue: 0.2150699496, alpha: 1))
            addSubview(circle)
        }
        if let recovered = viewModel?.recoverRate {
            let widthCircle1: CGFloat = 90
            let circle1 = CircleGraphic(frame: CGRect(x: xStart + widthCircle1 + spaceChart,
                                                      y: (height - widthCircle1) / 3,
                                                      width: widthCircle1, height: widthCircle1),
                                        percent: Int(recovered), title: App.TitleInChart.recovered, color: #colorLiteral(red: 0.8921368718, green: 0.07753541321, blue: 0.4605419636, alpha: 1))
            addSubview(circle1)
        }
        if let deadth = viewModel?.deadRate {
            let widthCircle2: CGFloat = 90
            let circle2 = CircleGraphic(frame: CGRect(x: xStart + 2 * widthCircle2 + 2 * spaceChart,
                                                      y: (height - widthCircle2) / 3,
                                                      width: widthCircle2, height: widthCircle2),
                                        percent: Int(deadth), title: App.TitleInChart.deadth, color: #colorLiteral(red: 0.01177123282, green: 0.786806643, blue: 0.9336950183, alpha: 1))
            addSubview(circle2)
        }
    }
}
