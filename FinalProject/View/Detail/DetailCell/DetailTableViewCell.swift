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
        let widthCircle: CGFloat = 100
        let circle = CircleGraphic(frame: CGRect(x: (self.width / 3), y: (self.height - widthCircle), width: widthCircle, height: widthCircle), percent: 50)
        self.addSubview(circle)
    }
}
