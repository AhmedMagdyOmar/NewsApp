//
//  ShapView.swift
//  zoz-driver
//
//  Created by rania refaat on 05/02/2023.
//

import UIKit

extension UIViewController {
    func drawBgShape(shape:CAShapeLayer, view: UIView , label: UILabel) {
        shape.path = UIBezierPath(arcCenter: CGPoint(x: label.frame.midX , y: label.frame.midY), radius: 20, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
        shape.strokeColor = UIColor.mainBorderColor?.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.lineWidth = 2.5
        view.layer.addSublayer(shape)
    }
    func drawTimeLeftShape(shape:CAShapeLayer, view: UIView , label: UILabel) {
        shape.path = UIBezierPath(arcCenter: CGPoint(x: label.frame.midX , y: label.frame.midY), radius: 20, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
        shape.strokeColor = UIColor.mainColor.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.lineWidth = 1.3
        view.layer.addSublayer(shape)
    }
}
extension Int {
    var degreesToRadians : CGFloat {
        return CGFloat(self) * .pi / 180
    }
}
