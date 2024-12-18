//
//  ContentView.swift
//  TradeApp
//
//  Created by Ammar Khan on 2024-12-18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 5) {
                HStack {
                    Text("B")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.mint)
                    
                    Text("Barterly")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
                Spacer(minLength: 0)
                
                TabView {
                    HomeView()
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                    SearchView()
                        .tabItem {
                            Label("Search", systemImage: "magnifyingglass")
                        }
                    Text("Create")
                        .tabItem {
                            Label("Create", systemImage: "plus")
                        }
                    Text("Chats")
                        .tabItem {
                            Label("Chats", systemImage: "message")
                        }
                    Text("Profile")
                        .tabItem {
                            Label("Profile", systemImage: "person")
                        }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
