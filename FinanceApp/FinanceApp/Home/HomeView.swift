//
//  HomeView.swift
//  FinanceApp
//
//  Created by Harsh Yadav on 17/05/22.
//

import SwiftUI

struct HomeView: View {
    @State var amount:String = ""
    @State var showPassBook:Bool = false
    @State var transactionNote:String = ""
    
    @State var moneyVariable:String = "1_000"
    @State var setMoneyLimit:Bool = false
    
    @State var showPassbook:Bool = false
    @State var showGraph:Bool = false
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                //MARK: Bank Balance
                VStack{
                    Text("\(String(format: "%.2f", viewModel.bankBalance))")
                        .fontWeight(.bold)
                        .font(.largeTitle)
//                        .onTapGesture {
//                            setMoneyLimit.toggle()
//                        }
//                        .alert("Set Limit", isPresented: $setMoneyLimit) {
//                            VStack{
//                                TextField("Enter Limit", text: $moneyVariable)
////                                    .keyboardType(.numberPad)
//                                Button("Login", action: {})
//                            }
//                        }
//                message: {
//                            Text("Please Enter Amount")
//                        }

                    Text("Bank Balance")
                        .font(.headline)
                }
                .padding()
//                .overlay{
//                    Circle()
//                        .trim(from: 0.30, to: 1)
//                        .rotation(Angle(degrees: 35))
//                        .stroke(lineWidth: 20)
//                        .frame(width: 200, height: 200, alignment: .center)
//                        .opacity(0.3)
//                        .foregroundColor(viewModel.bankBalance.isZero ? .red: .blue)
//                        .animation(Animation.default, value: viewModel.bankBalance.isZero)
//                }
//
//                .background{
//                    Circle()
//                        .trim(from: 0.30, to: (0.3) + CGFloat(viewModel.bankBalance/(Float(moneyVariable) ?? 100.0))*0.7)
//                        .rotation(Angle(degrees: 35))
//                        .stroke(lineWidth: 20)
//                        .frame(width: 200, height: 200, alignment: .center)
//                        .animation(Animation.easeInOut, value: viewModel.bankBalance)
//                        .opacity(0.4)
//                }
                
                Spacer()

                //MARK: Amount Text Field
                TextField("Enter Amount", text: $amount)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background{
                        let rec = Rectangle()
                        rec.foregroundColor(.gray).opacity(0.3)
                    }
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                //MARK: Note Regarding Transaction
                TextField("Note...", text: $viewModel.note)
                    .keyboardType(.default)
                    .padding()
                    .background{
                        let rec = Rectangle()
                        rec.foregroundColor(.gray).opacity(0.3)
                    }
                    .cornerRadius(10)
                    .padding()
                    
                
                
                //MARK: Transection Buttons
                HStack{
                    Button {
                        viewModel.bankingOperation(operation: .credit, amount: Float(amount) ?? 0)
                        amount = ""
                    } label: {
                        Text("Credit ₹")
                            .foregroundColor(.green)
                            .fontWeight(.bold)
                    }
                    
                    Spacer()
                    
                    Button{
                        viewModel.bankingOperation(operation: .debit, amount: Float(amount) ?? 0)
                        amount = ""
                        
                    } label: {
                        Text("Withdraw ₹")
                            .foregroundColor(.red)
                            .fontWeight(.bold)
                    }
                }
                .padding()
                
                
                Spacer()
                
                
                //MARK: User Message
                Text("\(viewModel.alertMsg)")
                    .font(.caption)
                
                Spacer()
            }
            
            .navigationTitle("Bank")
            .toolbar {
//                ToolbarItem {
//                    Text("Hello")
//                }
                Button {
                    showPassBook.toggle()
                } label: {
                        Image(systemName: "text.book.closed")

                }
//                Image(systemName: "text.book.closed")
//                    .onTapGesture {
//                        showPassBook.toggle()
//                    }
            }
            .sheet(isPresented: $showPassBook) {
//                    PassBookView()
                GraphView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.portrait)
    }
}
