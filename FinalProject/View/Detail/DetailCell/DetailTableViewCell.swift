//
//  DetailTableViewCell.swift
//  FinalProject
//
//  Created by PCI0001 on 9/22/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class DetailTableViewCell: UITableViewCell {

    // MARK: - IBOulets
    // MARK: - Properties
    private var graphs = CircleGraphic()

    override func awakeFromNib() {
        super.awakeFromNib()
        configCircleView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Private methods
    private func configCircleView() {
        let widthCircle1: CGFloat = 100
        let circle1 = CircleGraphic(frame: CGRect(x: (self.width / 3) - 305,
                                                  y: (self.height - widthCircle1) / 3 - 120,
                                                  width: widthCircle1, height: widthCircle1),
                                    percent: 50,
                                    title: "Deadth", color: .blue)
        self.addSubview(circle1)
        let widthCircle2: CGFloat = 100
        let circle2 = CircleGraphic(frame: CGRect(x: (self.width / 3) - 165,
                                                  y: (self.height - widthCircle2) / 3 - 120,
                                                  width: widthCircle2, height: widthCircle2),
                                    percent: 50,
                                    title: "Deadth", color: .yellow)
        self.addSubview(circle2)
        let widthCircle3: CGFloat = 100
        let circle3 = CircleGraphic(frame: CGRect(x: (self.width / 3) - 25,
                                                  y: (self.height - widthCircle3) / 3 - 120,
                                                  width: widthCircle3, height: widthCircle3),
                                    percent: 50, title: "Deadth",
                                    color: .darkGray)
        self.addSubview(circle3)
    }
}
