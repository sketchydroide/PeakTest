//
//  BrainScoreModel.swift
//  test
//
//  Created by Andre_Fonseca on 12/12/2017.
//  Copyright © 2017 Andre_Fonseca. All rights reserved.
//

import Foundation

enum BrainScoreModelError: Error {
    case parseError
}

struct BrainScoreModel{
    
    private(set) var scores: [ScoreModel] = []
    
    init(scoreArray: Array<Dictionary<String, Any>>) throws {
        do {
            for scoreDictionary in scoreArray {
                try scores.append(ScoreModel(scoreDictionary: scoreDictionary))
            }
        }
        catch {
            throw BrainScoreModelError.parseError
        }
    }
}
