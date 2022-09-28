//
//  BankHolder.swift
//  FinanceApp
//
//  Created by Harsh Yadav on 29/06/22.
//

import Foundation

struct BankBalanceHolder{
    static private var balance:Float = 0{
        didSet{
            print("Updated Balance: \(balance)")
        }
    }
    
    func addMoney(amount:Float){
        BankBalanceHolder.balance += amount
    }
    
    func debitMoney(amount:Float){
        BankBalanceHolder.balance -= amount
    }
    
    func getAmount()->Float{
        return BankBalanceHolder.balance
    }
}
