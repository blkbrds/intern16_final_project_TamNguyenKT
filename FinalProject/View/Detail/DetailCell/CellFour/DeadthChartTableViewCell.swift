//
//  CellFourTableViewCell.swift
//  FinalProject
//
//  Created by PCI0001 on 10/2/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class DeadthChartTableViewCell: UITableViewCell {

    // MARK: - IBOulets
    @IBOutlet private weak var barChart: CustomChart!

    // MARK: - Properties
    private var numberDays: Int = 19
    var viewModel: DeadthChartCellModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - Private methods
    private func generateDataEntries(valueArray: [Int], valueDeadth: Int) -> [BarEntry] {
        let valueTotal = valueArray
        let colors = [#colorLiteral(red: 0.8745098039, green: 0.8784313725, blue: 0.9490196078, alpha: 1)]
        var result: [BarEntry] = []
        for i in 0 ..< valueTotal.count {
            let value = valueTotal[i]
            let height: Float = Float(value) / Float(valueDeadth * 2)
            if var date = viewModel?.dateInDeadthChart {
                date.addTimeInterval(TimeInterval(24 * 60 * 60 * i))
                result.append(BarEntry(color: colors[i % colors.count], height: height, textValue: "\(value)", title: DateFormatter.dateFormaterInChart().string(from: date)))
            }
        }
        return result
    }

    private func updateView() {
        guard let viewModel = viewModel else { return }
        for item in viewModel.dayOneCountriesInChart {
            viewModel.deadthDayOneCountries.append(item.deaths)
        }
        viewModel.dateInDeadthChart.addTimeInterval(TimeInterval(-24 * 60 * 60 * numberDays))
        let dataEntries = generateDataEntries(valueArray: viewModel.deadthDayOneCountries, valueDeadth: viewModel.deadthDayOneCountries.last ?? 0)
        barChart.dataEntries = dataEntries
    }
}
