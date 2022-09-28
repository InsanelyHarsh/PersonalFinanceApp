//
//  TransactionHolder.swift
//  FinanceApp
//
//  Created by Harsh Yadav on 29/06/22.
//

import Foundation
class TransactionHolder{
    static private var transactionData:[TransactionModel] = []
    
    ///Add New Transaction
    func addTransaction(newTransaction:TransactionModel){
        switch newTransaction.operationType{
        case .credit:
            TransactionHolder.transactionData.append(newTransaction)
        case .debit:
            if(newTransaction.balanceRemaining >= 0){
                TransactionHolder.transactionData.append(newTransaction)
            }
        }
    }
    
    ///Remove Transaction
    func removeTransaction(transaction:TransactionModel){
        //remove Trans..
    }
    
    ///Get All Transaction Details
    func getTransactionDetails()->[TransactionModel]{
        return TransactionHolder.transactionData
    }
}
