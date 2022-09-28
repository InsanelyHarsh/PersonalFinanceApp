//
//  SpiltMoneyView.swift
//  FinanceApp
//
//  Created by Harsh Yadav on 03/07/22.
//

import SwiftUI

extension Color{
    static var customRandom:Color {
        return Color(.sRGB, red: .random(in: 0.3..<1), green: .random(in: 0.3..<1), blue: .random(in: 0.3..<1), opacity: 0.5)
    }
}
struct SpiltMoneyView: View {
    @State var personName:String = ""
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text("Add Person")
                    
                    TextField("Enter Name", text: $personName)
                        .padding(.leading)
                        .frame(height: 45, alignment: .center)
                        .background{ Color.gray.opacity(0.4).cornerRadius(10)}
                    Spacer()
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        Circle()
                            .foregroundColor(.customRandom)
                            .frame(width: 100, height: 100, alignment: .center)
                            .overlay {
                                Text("Harsh")
                            }
                        
                        Circle()
                            .foregroundColor(.customRandom)
                            .frame(width: 100, height: 100, alignment: .center)
                            .overlay {
                                Text("Janmesh")
                            }
                        
                        Circle()
                            .foregroundColor(.customRandom)
                            .frame(width: 100, height: 100, alignment: .center)
                            .overlay {
                                Text("Kailash")
                            }
                        
                        Circle()
                            .foregroundColor(.customRandom)
                            .frame(width: 100, height: 100, alignment: .center)
                            .overlay {
                                Text("Jitu")
                            }
                        
                        Circle()
                            .foregroundColor(.customRandom)
                            .frame(width: 100, height: 100, alignment: .center)
                            .overlay {
                                Text("Manoj")
                            }
                        Spacer()
                    }
                    .font(.system(size: 20))
                    .padding()
                }
                
//                Text("Amount")
                TextField("Amount", text: $personName)
                    .padding(.leading)
                    .frame(height: 45, alignment: .center)
                    .background{ Color.gray.opacity(0.4).cornerRadius(10)}
                    .padding(.horizontal)
                

                Button {
                    
                } label: {
                    Text("Add Payment")
                }

                
                Spacer()
            }
            .navigationTitle("Split Money")
        }
    }
}

struct SpiltMoneyView_Previews: PreviewProvider {
    static var previews: some View {
        SpiltMoneyView()
    }
}
