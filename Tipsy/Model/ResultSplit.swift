//
//  ResultSplit.swift
//  Tipsy
//
//  Created by Nestor Diazgranados on 1/30/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct ResultSplit {
    let numberOfPeople : Int
    let value: Double
    let percentage : Int
    
    init(numberOfPeople: Int = 0, value: Double = 0, percentage : Int = 0) {
        self.numberOfPeople = numberOfPeople
        self.value = value
        self.percentage = percentage
    }
}
