//
//  ScoreView.swift
//  test
//
//  Created by Andre_Fonseca on 12/12/2017.
//  Copyright © 2017 Andre_Fonseca. All rights reserved.
//

import UIKit

private enum Metrics {
    static let multilineMaxWidth: CGFloat = 80.0
    static let singleLineMaxWidth: CGFloat = 200.0
}

class ScoreView: UIView {
    @IBOutlet weak var scoreTitle: UILabel!
    @IBOutlet weak var scoreValue: UILabel!
    @IBOutlet weak var labelsVerticalConstraint: NSLayoutConstraint!
    
//    @IBOutlet weak var titleWidthContraint: NSLayoutConstraint!
    
    func setup(score: ScoreModel, isMultilineTitle: Bool) {
        
        scoreTitle.font = Fonts.scoreTitle
        scoreValue.font = Fonts.scoreValue
        scoreTitle.attributedText = score.title.localize().attributedStringForScoreTitle()
        scoreValue.attributedText = "\(score.value)".attributedStringForScoreValue()
        
        if isMultilineTitle {
            scoreTitle.numberOfLines = 0
            scoreTitle.preferredMaxLayoutWidth = Metrics.multilineMaxWidth
        }
        else {
            scoreTitle.numberOfLines = 1
            scoreTitle.preferredMaxLayoutWidth = Metrics.singleLineMaxWidth
        }
        
        scoreTitle.sizeToFit()
        
        frame = CGRect(x: 0, y: 0,
                       width: scoreTitle.frame.width,
                       height: scoreTitle.frame.height + scoreValue.frame.height + labelsVerticalConstraint.constant)
    }
}
