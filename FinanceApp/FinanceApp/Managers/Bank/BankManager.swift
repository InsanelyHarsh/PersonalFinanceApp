//
//  BankManager.swift
//  FinanceApp
//
//  Created by Harsh Yadav on 29/06/22.
//

import Foundation

protocol BankOperations{
    typealias completion = (Result<BankingOperationStatus,BankingError>)->Void
    
    func credit(amount:Float,note:String?)
    func debit(amount:Float,note:String?)
}

enum BankingError:Error{
    case insufficientBalance
    case invalidAmount
    case unknownError
}
enum BankingOperationStatus{
    case moneyCredited
    case moneyDebited
}


class BankManager:BankOperations{
    typealias completion = (Result<BankingOperationStatus,BankingError>)->Void
    
    let transactionManager:TransactionManager = TransactionManager(transactionHolder: TransactionHolder())
    
    var response:completion
    let bankHolder:BankBalanceHolder
    
    init(response:@escaping completion,bankHolder:BankBalanceHolder){
        self.response = response
        self.bankHolder = bankHolder
    }
    
    ///Credit Money From Bank Balance
    func credit(amount:Float,note:String?) {
        if (amount > 0){
            bankHolder.addMoney(amount: amount)
            self.addNewTransaction(amount: amount, note: note ?? "", operationType: .credit, balance: bankHolder.getAmount())
            self.response(.success(.moneyCredited))
        }
        else{
            self.response(.failure(.invalidAmount))
            print("Invalid Amount!")
        }
    }
    
    ///Withdraw Money from Account
    func debit(amount: Float,note:String?) {
        if(amount > 0){
            if(bankHolder.getAmount() >= amount){
                bankHolder.debitMoney(amount: amount)
                self.addNewTransaction(amount: amount, note: note ?? "", operationType: .debit, balance: bankHolder.getAmount())
                self.response(.success(.moneyDebited))
            }
            else{
                print("Insufficient Bank Balance")
                self.response(.failure(.insufficientBalance))
            }
        }
        else{
            self.response(.failure(.invalidAmount))
            print("Invalid Input!")
        }
    }
    
    ///Account Balance
    func getBalance()->Float {
        return bankHolder.getAmount()
    }
    
    ///Add New Transaction
    private func addNewTransaction(amount: Float, note: String, operationType: BankOperationType, balance: Float){
        self.transactionManager.addTransaction(amount: amount, note: note, operationType: operationType, balance: balance)
    }
}
