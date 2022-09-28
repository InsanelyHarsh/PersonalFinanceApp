//
//  ContentView.swift
//  FinanceApp
//
//  Created by Harsh Yadav on 17/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            GraphView()
                .tabItem {
                    Image(systemName: "ellipsis.circle")
                    Text("Details")
                }
            
            Text("Setting View")
                .tabItem {
                    Image(systemName: "gear")
                    Text("More")
                }
        }
        .tabViewStyle(.automatic)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
