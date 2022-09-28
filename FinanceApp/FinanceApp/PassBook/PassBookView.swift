//
//  PassBookView.swift
//  FinanceApp
//
//  Created by Harsh Yadav on 24/05/22.
//

import SwiftUI

enum TransactionType:String,CaseIterable{
    case history = "History"
    case creditHistory = "Credit"
    case debitHistory = "Debit"
}
struct PassBookView: View {
    @StateObject var vm:PassBookViewModel = PassBookViewModel()
    @State var transactionType:TransactionType = .history
    var body: some View {
        NavigationView{
            VStack{
                
                Picker("Transaction Type", selection: $transactionType) {
                    ForEach(TransactionType.allCases, id: \.self) {
                        Text("\($0.rawValue)")
                    }
                }
                .pickerStyle(.segmented)

                if vm.transactionList.isEmpty{
                    Text("No Transactions")
                    Text("Make Some Money")
                }
                
                List{
                    
                    ForEach(vm.transactionList,id: \.timeOfTransaction){ i in
                        
                        VStack(alignment: .leading){
                            HStack{

                                switch i.operationType{
                                case .debit:
                                    Text("-")
                                        .foregroundColor(.red)
                                case .credit:
                                    Text("+")
                                        .foregroundColor(.green)
                                }

                                Text("\(String(format: "%.2f", i.amount))")
                                    .foregroundColor(i.operationType == .debit ? .red:.green)

                                Spacer()

                                VStack{
                                    Text("Balance: \(String(format: "%.2f", i.balanceRemaining))")

    //                                Text("\(i.timeOfTransction.formatted(.dateTime))")
                                    Text("\(i.timeOfTransaction.formatted(date: .numeric, time: .shortened))")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                            
                            if(!i.note.isEmpty){
                                Text("Note: \(i.note)")
//                                    .padding()
                            }
                        }
                    }
                }
            }
            .onChange(of: transactionType, perform: { newValue in
                self.vm.getTransactionHistory(transactionType: newValue)
            })
            .onAppear{
                print(vm.transactionList)
//                sortedPassbook = passBookData.details.sorted { $0.amount > $1.amount }
//                self.sortedPassbook = passBookData.details
            }
            .navigationTitle("PassBook")
        }
    }
}

struct PassBookView_Previews: PreviewProvider {
    static var previews: some View {
        PassBookView()
    }
}
