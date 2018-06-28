//
//  CGPoint+PeakTest.swift
//  Test
//
//  Created by Andre Fonseca on 28/06/2018.
//  Copyright © 2018 Andre_Fonseca. All rights reserved.
//

import UIKit

extension CGPoint {
    init(at distance: CGFloat, from point: CGPoint, with angle: CGFloat) {
        self.init(x: point.x + distance*cos(angle),
                  y: point.y + distance*sin(angle))
    }
}
