//
//  TransactionViewModel.swift
//  FinanceApp
//
//  Created by Harsh Yadav on 24/05/22.
//

import Foundation

class PassBookViewModel:ObservableObject{
    @Published var transactionList:[TransactionModel] = []

    let transactionDetails:TransactionDetails = TransactionDetails()
    
    init(){
        self.getTransactionHistory(transactionType: .history)
    }
    
    ///Transaction History
    func getTransactionHistory(transactionType: TransactionType){
        switch transactionType {
        case .history:
            getAllTransaction()
        case .creditHistory:
            getCreditHistory()
        case .debitHistory:
            getDebitHistory()
        }
    }
    private func getAllTransaction(){
        self.transactionList = transactionDetails.getTransactionDetails()
    }
    
    private func getCreditHistory(){
        self.transactionList = transactionDetails.getTransactionDetails().filter({$0.operationType == .credit})
    }
    
    private func getDebitHistory(){
        self.transactionList = transactionDetails.getTransactionDetails().filter({$0.operationType == .debit})
    }
    
    func sortTransactions(){
        
    }
    
    //TODO: Update/Edit Transaction
//    func updateTransaction(transaction:TransactionModel){
//        let x = try? self.transactionManager.getTransactionDetails().firstIndex(where: {$0.timeOfTransaction == transaction.timeOfTransaction})
//        self.transactionManager.getTransactionDetails()[x!]
//        self.transactionManager.editTransactionDetail(transaction: transaction)
//    }
}
