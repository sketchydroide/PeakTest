//
//  Fonts.swift
//  test
//
//  Created by Andre_Fonseca on 10/12/2017.
//  Copyright © 2017 Andre_Fonseca. All rights reserved.
//

import UIKit

struct Fonts {
    struct Gotham {
        static func light(ofSize size: CGFloat) -> UIFont {
            return UIFont(name: "GothamSSm-Light", size: size)!
        }

        static func medium(ofSize size: CGFloat) -> UIFont {
            return UIFont(name: "GothamSSm-Medium", size: size)!
        }
    }
    
    static let screenTitle = Gotham.light(ofSize: 16)
    static let peakTitle = Gotham.medium(ofSize: 14)
    static let description = Gotham.light(ofSize: 13)
    static let scoreTitle = Gotham.light(ofSize: 13)
    static let scoreValue = Gotham.medium(ofSize: 14)
    static let share = Gotham.light(ofSize: 10)
}
