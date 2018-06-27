//
//  GradientView.swift
//  test
//
//  Created by Andre_Fonseca on 10/12/2017.
//  Copyright © 2017 Andre_Fonseca. All rights reserved.
//

import UIKit

@IBDesignable final class GradientView: UIView {
    
    @IBInspectable var topColor: UIColor = Color.topBackgroundGrey
    @IBInspectable var bottomColor: UIColor = Color.bottomBackgroundGrey
    
    override func draw(_ rect: CGRect) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = CGRect(x: CGFloat(0),
                                y: CGFloat(0),
                                width: superview!.frame.size.width,
                                height: superview!.frame.size.height)
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        layer.addSublayer(gradient)
    }
    
}
