//
//  SearchView.swift
//  TradeApp
//
//  Created by Ammar Khan on 2024-12-18.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack{
                TextField("Search Barterly...", text: $searchText)
                    .padding(10)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.horizontal)
                Spacer()
                Text("Search results will appear here.")
                    .foregroundColor(.gray)
            }
            .navigationTitle("Search")
        }
    }
}


#Preview {
    ContentView()
}
