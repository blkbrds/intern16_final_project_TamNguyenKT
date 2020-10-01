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

    // MARK: - Override methods
    override func prepareForReuse() {
        super.prepareForReuse()
        self.subviews.forEach { (item) in
             item.removeFromSuperview()
        }
    }

    // MARK: - Private methods
    private func updateView() {
        if let active = viewModel?.activeRate {
            let widthCircle: CGFloat = 100
            let circle = CircleGraphic(frame: CGRect(x: (self.width - widthCircle) / 3 - 85,
                                                     y: (self.height - widthCircle) / 3,
                                                     width: widthCircle, height: widthCircle),
                                       percent: Int(active), title: App.TitleInChart.active, color: #colorLiteral(red: 0.9752189517, green: 0.6860263348, blue: 0.1605846286, alpha: 1))
            self.addSubview(circle)
        }
        if let recovered = viewModel?.recoverRate {
            let widthCircle1: CGFloat = 100
            let circle1 = CircleGraphic(frame: CGRect(x: (self.width - widthCircle1) / 3 + 55,
                                                      y: (self.height - widthCircle1) / 3,
                                                      width: widthCircle1, height: widthCircle1),
                                        percent: Int(recovered), title: App.TitleInChart.recovered, color: #colorLiteral(red: 1, green: 0.4078431373, blue: 0.7921568627, alpha: 1))
            self.addSubview(circle1)
        }
        if let deadth = viewModel?.deadRate {
            let widthCircle2: CGFloat = 100
            let circle2 = CircleGraphic(frame: CGRect(x: (self.width - widthCircle2) / 3 + 195,
                                                      y: (self.height - widthCircle2) / 3,
                                                      width: widthCircle2, height: widthCircle2),
                                        percent: Int(deadth), title: App.TitleInChart.deadth, color: #colorLiteral(red: 0.3529411765, green: 0.3333333333, blue: 0.9960784314, alpha: 1))
            self.addSubview(circle2)
        }
    }
}
