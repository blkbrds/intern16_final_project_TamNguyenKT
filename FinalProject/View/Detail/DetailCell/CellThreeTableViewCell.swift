//
//  CellThreeTableViewCell.swift
//  FinalProject
//
//  Created by PCI0001 on 9/23/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit
import Charts
import TinyConstraints

final class CellThreeTableViewCell: UITableViewCell {

    // MARK: - Properties
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.backgroundColor = .clear

        chartView.rightAxis.enabled = false

        let yAxis = chartView.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(6, force: false)
        yAxis.labelTextColor = .black
        yAxis.axisLineColor = .black
        yAxis.labelPosition = .insideChart

        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.enabled = false
        chartView.xAxis.labelFont = .boldSystemFont(ofSize: 12)
        chartView.xAxis.setLabelCount(6, force: false)
        chartView.xAxis.labelTextColor = .white
        chartView.xAxis.axisLineColor = .systemBlue

        chartView.animate(xAxisDuration: 2)
        return chartView
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(lineChartView)
        lineChartView.centerInSuperview()
        lineChartView.width(400)
        lineChartView.heightToWidth(of: self)
        setData1()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    let yValues1: [ChartDataEntry] = [
        ChartDataEntry(x: 0.0, y: 10.0),
        ChartDataEntry(x: 1.0, y: 9.0),
        ChartDataEntry(x: 2.0, y: 8.0),
        ChartDataEntry(x: 3.0, y: 7.0),
        ChartDataEntry(x: 4.0, y: 10.0),
        ChartDataEntry(x: 5.0, y: 9.0),
        ChartDataEntry(x: 6.0, y: 8.0),
        ChartDataEntry(x: 7.0, y: 7.0),
        ChartDataEntry(x: 8.0, y: 10.0),
        ChartDataEntry(x: 9.0, y: 6.0),
        ChartDataEntry(x: 10.0, y: 8.0),
        ChartDataEntry(x: 11.0, y: 11.0),
        ChartDataEntry(x: 12.0, y: 12.0),
        ChartDataEntry(x: 13.0, y: 13.0),
        ChartDataEntry(x: 14.0, y: 14.0),
        ChartDataEntry(x: 15.0, y: 15.0),
        ChartDataEntry(x: 16.0, y: 16.0),
        ChartDataEntry(x: 17.0, y: 17.0),
        ChartDataEntry(x: 18.0, y: 18.0),
        ChartDataEntry(x: 19.0, y: 19.0),
        ChartDataEntry(x: 20.0, y: 20.0)
    ]

        func setData1() {
            let set1 = LineChartDataSet(entries: yValues1, label: "hihi")
            set1.mode = .cubicBezier
            set1.setColor(.red)
            //set1.fill = Fill(color: .black)
            set1.fillAlpha = 0.8
            set1.lineWidth = 2
            set1.drawCirclesEnabled = false
            //set1.drawFilledEnabled = true
            let data1 = LineChartData(dataSet: set1)
            lineChartView.data = data1
        }
}
