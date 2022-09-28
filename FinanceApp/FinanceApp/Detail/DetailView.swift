//
//  DetailView.swift
//  FinanceApp
//
//  Created by Harsh Yadav on 24/05/22.
//

import SwiftUI

struct DetailView: View {
    
    var body: some View {
        VStack{
            Text("Detail View")
            Text("This adding Here:")
            List{

                Text("Money Convertor")
                Text("Graph")
                Text("Bill Split")
            }
            
            
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
