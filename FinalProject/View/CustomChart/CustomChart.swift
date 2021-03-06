//
//  CustomChart.swift
//  FinalProject
//
//  Created by PCI0001 on 9/26/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class CustomChart: UIView {

    // MARK: - Properties
    // the width of each bar
    let barWidth: CGFloat = 25.0

    // space between each bar
    let space: CGFloat = 10

    // space at the bottom of the bar to show the title
    private let bottomSpace: CGFloat = 20.0

    // space at the top of each bar to show the value
    private let topSpace: CGFloat = 10.0

    // contain all layers of the chart
    private let mainLayer: CALayer = CALayer()

    // contain mainLayer to support scrolling
    private let scrollView: UIScrollView = UIScrollView()

    var dataEntries: [BarEntry]? = nil {
        didSet {
            mainLayer.sublayers?.forEach({ $0.removeFromSuperlayer() })
            if let dataEntries = dataEntries {
                scrollView.contentSize = CGSize(width: (barWidth + space) * CGFloat(dataEntries.count), height: self.frame.size.height)
                mainLayer.frame = CGRect(x: 0, y: 0, width: scrollView.contentSize.width, height: scrollView.contentSize.height)
                for i in 0..<dataEntries.count {
                    showEntry(index: i, entry: dataEntries[i])
                }
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    convenience init() {
        self.init(frame: CGRect.zero)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        scrollView.layer.addSublayer(mainLayer)
        self.addSubview(scrollView)
    }

    override func layoutSubviews() {
        scrollView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
    }

    private func showEntry(index: Int, entry: BarEntry) {
        // Starting x postion of the bar
        let xPos: CGFloat = space + CGFloat(index) * (barWidth + space)

        // Starting y postion of the bar
        let yPos: CGFloat = translateHeightValueToYPosition(value: entry.height)

        drawBar(xPos: xPos, yPos: yPos, color: entry.color)

        // Draw text above the bar
        drawTextValue(xPos: xPos - space / 2, yPos: yPos - 30, textValue: entry.textValue, color: .black)

        // Draw text below the bar
        drawTitle(xPos: xPos - space / 2, yPos: mainLayer.frame.height - bottomSpace + 10, title: entry.title, color: .black)
    }

    private func drawBar(xPos: CGFloat, yPos: CGFloat, color: UIColor) {
        let barLayer = CALayer()
        barLayer.frame = CGRect(x: xPos,
                                y: yPos,
                                width: barWidth,
                                height: mainLayer.frame.height - bottomSpace - yPos)
        barLayer.backgroundColor = color.cgColor
        mainLayer.addSublayer(barLayer)
    }

    private func drawTextValue(xPos: CGFloat, yPos: CGFloat, textValue: String, color: UIColor) {
        let textLayer = CATextLayer()
        textLayer.frame = CGRect(x: xPos, y: yPos, width: barWidth + space, height: 22)
        textLayer.foregroundColor = color.cgColor
        textLayer.backgroundColor = UIColor.clear.cgColor
        textLayer.alignmentMode = CATextLayerAlignmentMode.center
        textLayer.contentsScale = UIScreen.main.scale
        textLayer.font = CTFontCreateWithName(UIFont.systemFont(ofSize: 0).fontName as CFString, 0, nil)
        textLayer.fontSize = 10
        textLayer.string = textValue
        mainLayer.addSublayer(textLayer)
    }

    private func drawTitle(xPos: CGFloat, yPos: CGFloat, title: String, color: UIColor) {
        let textLayer = CATextLayer()
        textLayer.frame = CGRect(x: xPos, y: yPos, width: barWidth + space, height: 22)
        textLayer.foregroundColor = color.cgColor
        textLayer.backgroundColor = UIColor.clear.cgColor
        textLayer.alignmentMode = CATextLayerAlignmentMode.center
        textLayer.contentsScale = UIScreen.main.scale
        textLayer.font = CTFontCreateWithName(UIFont.systemFont(ofSize: 0).fontName as CFString, 0, nil)
        textLayer.fontSize = 10
        textLayer.string = title
        mainLayer.addSublayer(textLayer)
    }

    private func translateHeightValueToYPosition(value: Float) -> CGFloat {
        let height: CGFloat = CGFloat(value) * (mainLayer.frame.height - bottomSpace - topSpace)
        return mainLayer.frame.height - bottomSpace - height
    }
}
