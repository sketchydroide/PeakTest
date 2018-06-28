//
//  Color.swift
//  test
//
//  Created by Andre_Fonseca on 10/12/2017.
//  Copyright © 2017 Andre_Fonseca. All rights reserved.
//

import UIKit

extension UIColor {
    struct PeakColor {
        
        struct Blue {
            static let regular = UIColor(red: 0, green: 138, blue: 255)
            static let lightning = UIColor(red: 0, green: 184, blue: 252)
        }
        
        struct Purple {
            static let regular = UIColor(red: 88, green: 86, blue: 214)
        }
        
        struct Red {
            static let regular = UIColor(red: 255, green: 59, blue: 48)
            static let pink = UIColor(red: 255, green: 45, blue: 85)
            static let orange = UIColor(red: 255, green: 149, blue: 0)
        }
        
        struct Green {
            static let regular = UIColor(red: 76, green: 217, blue: 100)
        }
        
        struct Grey{
            static let regular = UIColor(red: 74, green: 74, blue: 74)
            static let light = UIColor(red: 142, green: 142, blue: 147)
            static let topBackground = UIColor(red: 24, green: 24, blue: 24)
            static let bottomBackground = UIColor(red: 52, green: 52, blue: 52)
        }
    }
}

private extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red)/255,
                  green: CGFloat(green)/255,
                  blue: CGFloat(blue)/255, alpha: 1.0)
    }
}
