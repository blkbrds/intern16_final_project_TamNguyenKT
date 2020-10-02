//
//  CellThreeTableViewCell.swift
//  FinalProject
//
//  Created by PCI0001 on 9/23/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class CellThreeTableViewCell: UITableViewCell {

    // MARK: - IBOulets
    @IBOutlet private weak var barChart: CustomChart!

    // MARK: - Properties
    var viewModel: CellThreeCellModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - Private methods
    func generateDataEntries(a: [Int], b: Int) -> [BarEntry] {
        let valueTotal = a
        let colors = [#colorLiteral(red: 0.9752189517, green: 0.6860263348, blue: 0.1605846286, alpha: 1)]
        var result: [BarEntry] = []
        for i in 0 ..< valueTotal.count {
            let value = valueTotal[i]
            //var height: Float

            let height: Float = Float(value) / Float(b * 2)

            let formatter = DateFormatter()
            formatter.dateFormat = "d MMM"
            var date = Date()
            date.addTimeInterval(TimeInterval(24 * 60 * 60 * i))
            result.append(BarEntry(color: colors[i % colors.count], height: height, textValue: "\(value)", title: formatter.string(from: date)))
        }
        return result
    }

    private func updateView() {
        guard let viewModel = viewModel else { return }
        for item in viewModel.dayOneCountries {
            viewModel.confirmedDayOneCountries.append(item.confirmed)
        }
        let dataEntries = generateDataEntries(a: viewModel.confirmedDayOneCountries, b: viewModel.confirmedDayOneCountries.last ?? 0)
        barChart.dataEntries = dataEntries
    }
}
