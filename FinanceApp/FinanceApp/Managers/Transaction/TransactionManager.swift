//
//  TransactionManager.swift
//  FinanceApp
//
//  Created by Harsh Yadav on 29/06/22.
//

import Foundation

///Basically add these update to DB,server or at any Place.
protocol Transactions{
    func addTransaction(amount:Float,note:String,operationType:BankOperationType,balance:Float)
}

///And Fetch Data from DB/Server. and perform CRUD operation.
protocol TransactionOperations{
    func getTransactionDetails()->[TransactionModel]
    func editTransactionDetail(transaction:TransactionModel)
}


class TransactionDetails:TransactionOperations{
    private let transactionHolder:TransactionHolder = TransactionHolder()
    func getTransactionDetails()->[TransactionModel]{
        return transactionHolder.getTransactionDetails()
    }
    
    func editTransactionDetail(transaction:TransactionModel) {
        print("TODO: Transaction Edited")
    }
}

class Transaction:Transactions{
    let transactionHolder:TransactionHolder
    init(transactionHolder:TransactionHolder){
        self.transactionHolder = transactionHolder
    }
    func addTransaction(amount: Float, note: String, operationType: BankOperationType, balance: Float) {
        self.transactionHolder.addTransaction(newTransaction: TransactionModel(amount: amount, timeOfTransaction: Date.now, note: note, balanceRemaining: balance, operationType: operationType))
    }
//    func addTransaction(amount: Float, note: String, operationType: BankOperationType,balance:Float) {
////        if(operationType == .credit){
////            TransactionHolder.transactionData.append(
////                TransactionModel(amount: amount, timeOfTransaction: Date.now, note: note, balanceRemaining: balance, operationType: operationType))
////        }
//        if((operationType == .debit && balance>0) || operationType == .credit){
//            TransactionHolder.transactionData.append(TransactionModel(amount: amount, timeOfTransaction: Date.now, note: note, balanceRemaining: balance, operationType: operationType))
//        }
//    }
}


class TransactionManager:Transactions, TransactionOperations{
    private let transactionHolder:TransactionHolder
    init(transactionHolder:TransactionHolder){
        self.transactionHolder = transactionHolder
    }
    func addTransaction(amount: Float, note: String, operationType: BankOperationType, balance: Float) {
        self.transactionHolder.addTransaction(newTransaction: TransactionModel(amount: amount, timeOfTransaction: Date.now, note: note, balanceRemaining: balance, operationType: operationType))
    }

    func getTransactionDetails()->[TransactionModel]{
        return transactionHolder.getTransactionDetails()
    }
    
    func editTransactionDetail(transaction:TransactionModel) {
        print("TODO: Transaction Edited")
    }
}
