//
//  Animations.swift
//  Test
//
//  Created by Andre Fonseca on 27/06/2018.
//  Copyright © 2018 Andre_Fonseca. All rights reserved.
//

import UIKit
import CoreGraphics

private enum Declaration {
    static let animationTime: TimeInterval = 1.0
    static let graphOpacity: Float = 0.8
    static let circleTotal: Int = 10
    static let colorsAvailable = [UIColor.PeakColor.Blue.lightning,
                                  UIColor.PeakColor.Red.pink,
                                  UIColor.PeakColor.Green.regular,
                                  UIColor.PeakColor.Purple.regular,
                                  UIColor.PeakColor.Red.orange,
                                  UIColor.PeakColor.Blue.regular,
                                  UIColor.PeakColor.Red.regular]
}

protocol ShapeAnimation { }

extension ShapeAnimation {
    
    func animate(shape:CAShapeLayer, animateIn: Bool, in view: UIView) {
        
        let opacityFromValue: Float
        let opacityToValue: Float
        let scaleFromValue: Float
        let scaleToValue: Float
        let positionFromValue: CGPoint
        let positionToValue: CGPoint
        
        if animateIn {
            opacityFromValue = 0.0
            opacityToValue = Declaration.graphOpacity
            scaleFromValue = 0.0
            scaleToValue = 1.0
            positionFromValue = makeFrameCenter(view: view)
            positionToValue = CGPoint.zero
        } else {
            opacityFromValue = Declaration.graphOpacity
            opacityToValue = 0.0
            scaleFromValue = 1.0
            scaleToValue = 0.0
            positionFromValue = CGPoint.zero
            positionToValue =  makeFrameCenter(view: view)
        }
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.duration = Declaration.animationTime
        opacityAnimation.fromValue = opacityFromValue
        opacityAnimation.toValue = opacityToValue
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.duration = Declaration.animationTime
        scaleAnimation.fromValue =  scaleFromValue
        scaleAnimation.toValue = scaleToValue
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        let positionAnimation = CABasicAnimation(keyPath: "position")
        positionAnimation.duration = Declaration.animationTime
        positionAnimation.fromValue = positionFromValue
        positionAnimation.toValue = positionToValue
        positionAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        shape.add(scaleAnimation, forKey: "transform.scale")
        shape.add(positionAnimation, forKey: "position")
        shape.add(opacityAnimation, forKey: "opacity")
    }
    
    func makeFrameCenter(view: UIView) -> CGPoint {
        return CGPoint(x: view.frame.width/2.0, y: view.frame.height/2.0)
    }
}
