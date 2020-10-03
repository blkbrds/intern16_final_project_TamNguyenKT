//
//  GraphicDraw.swift
//  FinalProject
//
//  Created by PCI0001 on 9/26/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

@IBDesignable
class CircleGraphic: UIView {

    // MARK: - Properties
    private var path = UIBezierPath()
    private let OutsideShapeLayer = CAShapeLayer()

    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.masksToBounds = false
    }

    convenience init(frame: CGRect, percent value: Int, title: String, color: UIColor) {
        self.init(frame: frame)
        createCircle(with: value, with: color)
        createLabel(with: value, with: title)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private functions
    private func createCircle(with value: Int, with color: UIColor) {
        // background layer
        let frameWidth = min(bounds.width, bounds.height)
        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: frameWidth, height: frameWidth))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.gray.cgColor
        shapeLayer.strokeStart = 0.0
        shapeLayer.strokeEnd = 1
        shapeLayer.lineWidth = 20
        layer.addSublayer(shapeLayer)
        // ADD LAYER
        let center = CGPoint(x: bounds.height / 2, y: bounds.width / 2)
        let path1 = UIBezierPath(arcCenter: center, radius: frameWidth / 2, startAngle: -.pi / 2, endAngle: 3 * .pi / 2, clockwise: true)
        OutsideShapeLayer.path = path1.cgPath
        OutsideShapeLayer.fillColor = UIColor.clear.cgColor
        OutsideShapeLayer.strokeColor = color.cgColor
        OutsideShapeLayer.strokeStart = 0.0
        OutsideShapeLayer.strokeEnd = CGFloat(value) / 100
        OutsideShapeLayer.lineCap = .round
        OutsideShapeLayer.lineWidth = 20
        layer.addSublayer(OutsideShapeLayer)
    }

    private func createLabel(with num: Int, with title: String) {
        let numberLabel = UILabel()
        numberLabel.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.width)
        numberLabel.textAlignment = .center
        numberLabel.text = String(num) + " %"
        addSubview(numberLabel)
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 0, y: 70, width: bounds.width, height: bounds.width)
        titleLabel.textAlignment = .center
        titleLabel.text = title
        addSubview(titleLabel)
    }
}
