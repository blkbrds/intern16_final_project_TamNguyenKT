//
//  DetailTableViewCell.swift
//  FinalProject
//
//  Created by PCI0001 on 9/22/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit
import Charts

final class DetailTableViewCell: UITableViewCell {

    // MARK: - IBOulets
    @IBOutlet private weak var pieChart: PieChartView!

    // MARK: - Properties
    var viewModel: DetailCellModel = DetailCellModel() {
        didSet {
            updateView()
        }
    }

    // MARK: - Override methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Private methods

    private func customizeChart(dataPoints: [String], values: [Double]) {

        // 1. Set ChartDataEntry
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i], data: dataPoints[i] as AnyObject)
            dataEntries.append(dataEntry)
        }
        // 2. Set ChartDataSet
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
        pieChartDataSet.colors = colorsOfCharts(numbersOfColor: dataPoints.count)
        // 3. Set ChartData
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        pieChartData.setValueFormatter(formatter)
        // 4. Assign it to the chart’s data
        pieChart.data = pieChartData
    }

    private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
        var colors: [UIColor] = []
        for _ in 0 ..< numbersOfColor {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            let color = UIColor(red: CGFloat(red / 255), green: CGFloat(green / 255), blue: CGFloat(blue / 255), alpha: 1)
            colors.append(color)
        }
        return colors
    }

    private func updateView() {
        let items = ["Total recovered", "Total deadths", "Total active"]
        let percents = [viewModel.recoverRate, viewModel.deadthRate, viewModel.activeRate]
        customizeChart(dataPoints: items, values: percents.map { Double($0) })
    }
}

// MARK: - Extension CharViewDelegate
extension DetailTableViewCell: ChartViewDelegate {
}
