//
//  DetailTableViewCell.swift
//  FinalProject
//
//  Created by PCI0001 on 9/22/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class DetailTableViewCell: UITableViewCell {

    // MARK: - Properties
    var viewModel: DetailCellModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - Override methods
    override func prepareForReuse() {
        super.prepareForReuse()
        subviews.forEach { (item) in
            item.removeFromSuperview()
        }
    }

    // MARK: - Private methods
    private func updateView() {
        let spaceChart: CGFloat = width / 8
        if let active = viewModel?.activeRate {
            let widthCircle: CGFloat = 90
            let circle = CircleGraphic(frame: CGRect(x: 20,
                                                     y: (height - widthCircle) / 3,
                                                     width: widthCircle, height: widthCircle),
                                       percent: Int(active), title: App.TitleInChart.active, color: #colorLiteral(red: 0.8196078431, green: 0.9568627451, blue: 0.9607843137, alpha: 1))
            addSubview(circle)
        }
        if let recovered = viewModel?.recoverRate {
            let widthCircle1: CGFloat = 90
            let circle1 = CircleGraphic(frame: CGRect(x: 20 + widthCircle1 + spaceChart,
                                                      y: (height - widthCircle1) / 3,
                                                      width: widthCircle1, height: widthCircle1),
                                        percent: Int(recovered), title: App.TitleInChart.recovered, color: #colorLiteral(red: 1, green: 0.8196078431, blue: 0.831372549, alpha: 1))
            addSubview(circle1)
        }
        if let deadth = viewModel?.deadRate {
            let widthCircle2: CGFloat = 90
            let circle2 = CircleGraphic(frame: CGRect(x: 20 + 2 * widthCircle2 + 2 * spaceChart,
                                                      y: (height - widthCircle2) / 3,
                                                      width: widthCircle2, height: widthCircle2),
                                        percent: Int(deadth), title: App.TitleInChart.deadth, color: #colorLiteral(red: 0.5607843137, green: 0.5841821147, blue: 0.7764705882, alpha: 1))
            addSubview(circle2)
        }
    }
}
