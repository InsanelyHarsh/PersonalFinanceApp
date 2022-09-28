//
//  MoneySplitModel.swift
//  FinanceApp
//
//  Created by Harsh Yadav on 03/07/22.
//

import Foundation
struct MoneySplitModel{
    var numberOfPeople:Int
    var personNames:[String]
    var occasion:[Occasion] // number of time any purchasing/ payment happened.
}

struct Occasion{
    var amountPaid:Int
}
