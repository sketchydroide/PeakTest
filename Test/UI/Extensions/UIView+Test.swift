//
//  UIView+Test.swift
//  test
//
//  Created by Andre_Fonseca on 12/12/2017.
//  Copyright © 2017 Andre_Fonseca. All rights reserved.
//

import UIKit

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

private enum Metrics {
    static let shadowColor = UIColor.black.cgColor
    static let shadowRadius: CGFloat = 30.0
    static let shadowOpacity: Float = 0.4
    static let shadowOffset = CGSize(width: 0, height: 0)
}

//MARK: - Drawing methods
extension UIView {
    func drawCircle(with strokeColor: UIColor,
                    with radius: CGFloat,
                    at centerPoint: CGPoint) {
        
        let shape = CAShapeLayer()
        let path = UIBezierPath(arcCenter: centerPoint,
                                radius: radius,
                                startAngle: 0,
                                endAngle: 2.0 * CGFloat.pi,
                                clockwise: true)
        shape.path = path.cgPath
        shape.strokeColor = strokeColor.cgColor
        shape.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shape)
    }
    
    func drawLine(starting startPoint: CGPoint,
                  ending endPoint: CGPoint,
                  and color: UIColor) {
        
        let shape = CAShapeLayer()
        let path = UIBezierPath()
        
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        
        shape.path = path.cgPath
        shape.strokeColor = color.cgColor
        
        self.layer.addSublayer(shape)
    }
    
    func drawShape(
        points: Array<CGPoint>,
        color: UIColor) -> CAShapeLayer? {
        
        guard points.count > 0 else{
            return nil
        }
        
        let shape = CAShapeLayer()
        let path = UIBezierPath()
        
        path.move(to: points[0])
        
        for index in 1..<points.count {
            path.addLine(to: points[index])
        }
        
        shape.path = path.cgPath
        shape.fillColor = color.cgColor
        shape.strokeColor = color.cgColor
        
        shape.shadowColor = Metrics.shadowColor
        shape.shadowRadius = Metrics.shadowRadius
        shape.shadowOpacity = Metrics.shadowOpacity
        shape.shadowOffset = Metrics.shadowOffset
        
        self.layer.addSublayer(shape)
        return shape
    }
}

