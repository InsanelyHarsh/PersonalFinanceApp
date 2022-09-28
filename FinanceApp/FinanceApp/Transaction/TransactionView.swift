//
//  TransactionView.swift
//  FinanceApp
//
//  Created by Harsh Yadav on 25/05/22.
//

import SwiftUI

struct TransactionView: View {
    @State var amount:String = ""
    
    @State private var birthDate = Date()
    
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }()
    
    var body: some View {
        VStack{
                //MARK: Text Field
                TextField("₹ Enter Amount", text: $amount)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background{
                        Rectangle().foregroundColor(.gray).opacity(0.3)
                    }
                    .cornerRadius(10)
                    .padding()
                  
            
            
                TextField("Note", text: $amount)
                    .keyboardType(.default)
                    .padding()
                    .background{
                        Rectangle().foregroundColor(.gray).opacity(0.3)
                            .frame(height: 50)
                    }
                    .cornerRadius(10)
                    .padding()

            
            //TODO: Date Picker
            
            //TODO: Payment Method
            
            //TODO: Money Split-> Number of poeple in which money will be splited
            
            
            //MARK: Transaction Buttons
            HStack{
                Button{
                    
                } label: {
                    Text("Credit")
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal)
                        .background{
                            Rectangle()
                                .foregroundColor(.green)
                                .cornerRadius(10)
                        }
                }
                
                Spacer()
                
                Button{
                    
                } label: {
                    Text("Debit")
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal)
                        .background{
                            Rectangle()
                                .foregroundColor(.red)
                                .opacity(0.7)
                                .cornerRadius(10)
                        }
                }
            }
            .padding()
            
            
           Spacer()
            
        }
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
//            .preferredColorScheme(.dark)
    }
}
