//
//  ScoreModel.swift
//  test
//
//  Created by Andre_Fonseca on 12/12/2017.
//  Copyright © 2017 Andre_Fonseca. All rights reserved.
//

import Foundation

private enum Key: String {
    case scoreValue
    case scoreTitle
}

private enum Score {
    static let maxScore: Float = 1200.0
}

enum ScoreModelError: Error {
    case titleParseError
    case valueParseError
}

struct ScoreModel{
    
   private(set) var value: Int
   private(set) var title: String
   private(set) var maxScore: Float = Score.maxScore
    
    init(scoreDictionary: Dictionary<String, Any>) throws {
        if let title = scoreDictionary[Key.scoreTitle.rawValue] as! String? {
            self.title = title
        } else {
            throw ScoreModelError.titleParseError
        }
        
        if let value = scoreDictionary[Key.scoreValue.rawValue] as! Int? {
            self.value = value
        } else {
            throw ScoreModelError.valueParseError
        }
    }
}
