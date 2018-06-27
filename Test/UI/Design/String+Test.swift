//
//  String+Test.swift
//  Test
//
//  Created by Andre_Fonseca on 14/12/2017.
//  Copyright © 2017 Andre_Fonseca. All rights reserved.
//

import UIKit

extension String {
    
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    func attributedStringForScreenTitle() -> NSAttributedString {
        return attributedString(withLetterSpacing: Style.LetterSpacing.screenTitle,
                                textColor: UIColor.white)
    }
    
    func attributedStringForMapTitle() -> NSAttributedString {
        return attributedString(withLetterSpacing: Style.LetterSpacing.mapTitle,
                                textColor: UIColor.white)
    }
    
    func attributedStringForDescription() -> NSAttributedString {
        return attributedString(withLetterSpacing: Style.LetterSpacing.description,
                                lineHeight: Style.LineHeight.description,
                                textColor:  UIColor.white)
    }
    
    func attributedStringForScoreValue() -> NSAttributedString {
        return attributedString(withLetterSpacing: Style.LetterSpacing.description,
                                lineHeight: Style.LineHeight.scoreTitle,
                                textColor: UIColor.white)
    }

    func attributedStringForScoreTitle() -> NSAttributedString {
        return attributedString(withLetterSpacing: Style.LetterSpacing.description,
                                lineHeight: Style.LineHeight.scoreTitle,
                                textColor: UIColor.white)
    }
    
    func attributedStringForShare() -> NSAttributedString {
        return attributedString(withLetterSpacing: Style.LetterSpacing.description,
                                lineHeight: Style.LineHeight.description,
                                textColor: UIColor.PeakColor.Grey.regular)
    }
    
    func attributedString(withLetterSpacing spacing: CGFloat? = nil,
                          lineHeight: Style.LineHeight? = nil,
                          textAlignment: NSTextAlignment? = .center,
                          textColor: UIColor? = nil) -> NSAttributedString {
        var attributes: [NSAttributedStringKey: Any] = [:]
        let style = NSMutableParagraphStyle()
        
        if let spacing = spacing {
            attributes[NSAttributedStringKey.kern] = spacing
        }
        
        if let lineHeight = lineHeight {
            style.minimumLineHeight = lineHeight.rawValue
            attributes.updateValue(style, forKey: NSAttributedStringKey.paragraphStyle)
        }
        
        if let textAlignment = textAlignment {
            style.alignment = textAlignment
            attributes.updateValue(style, forKey: NSAttributedStringKey.paragraphStyle)
        }
        
        if let textColor = textColor {
            attributes[NSAttributedStringKey.foregroundColor] = textColor
        }
        
        return .init(string: self, attributes: attributes)
    }
}
