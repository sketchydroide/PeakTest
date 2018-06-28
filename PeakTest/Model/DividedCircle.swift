//
//  DividedCircle
//  PeakTest
//
//  Created by Andre Fonseca on 28/06/2018.
//  Copyright © 2018 Andre_Fonseca. All rights reserved.
//

import UIKit

struct DividedCircle {
    let angleBetweenLines: CGFloat
    let startAngle: CGFloat
    
    init(number: Int) {
        angleBetweenLines = CGFloat.pi*2.0/CGFloat(number)
        startAngle = -CGFloat.pi/2.0
    }
}
