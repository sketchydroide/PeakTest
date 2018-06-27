//
//  ABTestApi.swift
//  Test
//
//  Created by Andre_Fonseca on 16/12/2017.
//  Copyright © 2017 Andre_Fonseca. All rights reserved.
//

import Foundation

private enum ABTests {
    static let useExtraCategory = false
}

struct ABTestApi {
    let useExtraCategoryABTest: Bool
    
    init() {
        useExtraCategoryABTest = ABTests.useExtraCategory
    }
}
