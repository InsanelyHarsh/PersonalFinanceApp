//
//  HomeViewModel.swift
//  FinanceApp
//
//  Created by Harsh Yadav on 17/05/22.
//

import Foundation
enum Operations{
    case credit
    case debit
}


class HomeViewModel:ObservableObject{
    
    @Published var bankBalance:Float = 0
    @Published var note:String = ""
    
    @Published var showAlert:Bool = false
    @Published var alertMsg:String = ""
    
    var successResponse:BankingOperationStatus?
    var failureResponse:BankingError?
    let bank:BankManager = BankManager(response: { _ in}, bankHolder: BankBalanceHolder())
    
    
    func bankingOperation(operation:BankOperationType,amount:Float){
        switch operation {
        case .debit:
            self.bank.debit(amount: amount,note: note)
            showMsg()
        case .credit:
            self.bank.credit(amount: amount,note: note)
            showMsg()
        }
       
        getBankBalance() //update Balance
    }
    
    func getBankBalance(){
        self.bankBalance = self.bank.getBalance() //not using BankBalanceHolder.balance because of Dependency..
    }

    private func showMsg(){
        self.bank.response = { res in
            switch res{
            case .success(let success):
                switch success{
                case .moneyCredited:
                    self.alertMsg = "Money Credited!"
                case .moneyDebited:
                    self.alertMsg = "Money Debited!"
                }
            case .failure(let failure):
                switch failure{
                case .insufficientBalance:
                    self.alertMsg = "Insufficient Balance"
                case .invalidAmount:
                    self.alertMsg = "Invalid Amount !!"
                case .unknownError:
                    self.alertMsg = "An Unknown Error Occured"
                }
            }
        }
    }
}
