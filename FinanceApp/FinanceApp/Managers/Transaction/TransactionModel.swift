//
//  TransactionModel.swift
//  FinanceApp
//
//  Created by Harsh Yadav on 29/06/22.
//

import Foundation

enum BankOperationType:String{
    case debit = "Debit"
    case credit = "Credit"
}


struct TransactionModel{
    var amount:Float
    var timeOfTransaction:Date
    var note:String
    var balanceRemaining:Float
    var operationType:BankOperationType
}
