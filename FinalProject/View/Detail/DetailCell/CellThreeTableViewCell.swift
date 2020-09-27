//
//  CellThreeTableViewCell.swift
//  FinalProject
//
//  Created by PCI0001 on 9/23/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class CellThreeTableViewCell: UITableViewCell {

    // MARK: - IBOUlets
    @IBOutlet private weak var barChart: CustomChart!

    // MARK: - Override methods
    override func awakeFromNib() {
        super.awakeFromNib()
        let dataEntries = generateDataEntries()
        barChart.dataEntries = dataEntries
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func generateDataEntries() -> [BarEntry] {
        let valueTotal = [40, 50, 60, 70, 80, 50, 50, 90, 50, 70]
        let colors = [#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)]
        var result: [BarEntry] = []
        for i in 0 ..< valueTotal.count {
            let value = valueTotal[i]
            let height: Float = Float(value) / 100.0

            let formatter = DateFormatter()
            formatter.dateFormat = "d MMM"
            var date = Date()
            date.addTimeInterval(TimeInterval(24 * 60 * 60 * i))
            result.append(BarEntry(color: colors[i % colors.count], height: height, textValue: "\(value)", title: formatter.string(from: date)))
        }
        return result
    }
}
