//
//  CellThreeTableViewCell.swift
//  FinalProject
//
//  Created by PCI0001 on 9/23/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class ConfirmChartTableViewCell: UITableViewCell {

    // MARK: - IBOulets
    @IBOutlet private weak var barChart: CustomChart!

    // MARK: - Properties
    private var numberDays: Int = 99
    var viewModel: ConfirmChartCellModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - Private methods
    func generateDataEntries(valueArray: [Int], valueConfirmed: Int) -> [BarEntry] {
        let valueTotal = valueArray
        let colors = [#colorLiteral(red: 0.05882352941, green: 0.1058823529, blue: 0.2156862745, alpha: 1)]
        var result: [BarEntry] = []
        for i in 0 ..< valueTotal.count {
            let value = valueTotal[i]
            let height: Float = Float(value) / Float(valueConfirmed * 2)
            if var date = viewModel?.dateInConfirmChart {
                date.addTimeInterval(TimeInterval(24 * 60 * 60 * i))
                result.append(BarEntry(color: colors[i % colors.count], height: height, textValue: "\(value)", title: DateFormatter.dateFormaterInChart().string(from: date)))
            }
        }
        return result
    }

    private func updateView() {
        guard let viewModel = viewModel else { return }
        for item in viewModel.dayOneCountries {
            viewModel.confirmedDayOneCountries.append(item.confirmed)
        }
        viewModel.dateInConfirmChart.addTimeInterval(TimeInterval(-24 * 60 * 60 * 99))
        let dataEntries = generateDataEntries(valueArray: viewModel.confirmedDayOneCountries, valueConfirmed: viewModel.confirmedDayOneCountries.last ?? 0)
        barChart.dataEntries = dataEntries
    }
}
