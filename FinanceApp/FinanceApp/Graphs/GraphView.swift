//
//  GraphView.swift
//  FinanceApp
//
//  Created by Harsh Yadav on 27/09/22.
//

import SwiftUI
import Charts

struct GraphView: View {
    @ObservedObject var vm:PassBookViewModel = PassBookViewModel()
    var body: some View {
        VStack{
//            ForEach(vm.transactionList,id:\.timeOfTransaction) { i in
//                Chart{
//                    BarMark(
//                                x: .value("Amount", i.amount),
//                                y: .value("Limit", 100)
//                            )
//                }
//            }
//            .frame(height: 150, alignment: .center)
//            .padding(.horizontal)
            
            Chart(vm.transactionList, id: \.timeOfTransaction) { data in
                LineMark(x: .value("Time", data.timeOfTransaction), y: .value("Amount", data.amount))
                    .foregroundStyle(data.operationType == .debit ? .red : .green)
            }
            .frame(height: 200, alignment: .center)
            .padding(.horizontal)
        }
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}
