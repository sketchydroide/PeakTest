//
//  BrainScoreRepository.swift
//  test
//
//  Created by Andre_Fonseca on 12/12/2017.
//  Copyright © 2017 Andre_Fonseca. All rights reserved.
//

import UIKit

private enum Key: String{
    case myBrainMap
    case ageGroupMap
    case professionMap
}

private enum Declaration{
    static let brainMapFileName: String = "BrainMap"
    static let brainMapABTesctingFileName: String = "BrainMap2"
    static let plistFileType: String = "plist"
}

struct BrainScoreRepository {
    
    private(set) var myBrainMap: BrainScoreModel?
    private(set) var ageGroupMap: BrainScoreModel?
    private(set) var professionMap: BrainScoreModel?
    
    init() {
        
        var myMapsDictionary: NSDictionary?
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //Test if the AB Test if for 6 or 7 categories
        let useExtraCategoryABTest = appDelegate.aBTestApi.useExtraCategoryABTest
        
        let fileName = useExtraCategoryABTest ? Declaration.brainMapABTesctingFileName : Declaration.brainMapFileName
        
        if let path = Bundle.main.path(
            forResource: fileName,
            ofType: Declaration.plistFileType) {
            myMapsDictionary = NSDictionary(contentsOfFile: path)
        }
        
        guard let mapsDictionary = myMapsDictionary else{
            return
        }
        
        do {
            if let myBrainMapDictionary = mapsDictionary[Key.myBrainMap.rawValue] as! Array<Dictionary<String, Any>>? {
                myBrainMap = try BrainScoreModel(scoreArray: myBrainMapDictionary)
            }
            
            if let myBrainMapDictionary = mapsDictionary[Key.ageGroupMap.rawValue] as! Array<Dictionary<String, Any>>? {
                ageGroupMap = try BrainScoreModel(scoreArray: myBrainMapDictionary)
            }
            
            if let myBrainMapDictionary = mapsDictionary[Key.professionMap.rawValue] as! Array<Dictionary<String, Any>>? {
                professionMap = try BrainScoreModel(scoreArray: myBrainMapDictionary)
            }
        }
        catch {
            print("!!! Parsing Brain Map Error !!!")
        }
    }
}

