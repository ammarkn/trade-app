//
//  ContentView.swift
//  TradeApp
//
//  Created by Ammar Khan on 2024-12-18.
//

import SwiftUI

struct ContentView: View {
    @State private var authenticatedUser: User? = nil
    @State private var isAuthenticated = true
    
    var body: some View {
        NavigationView {
            if isAuthenticated {
                VStack(spacing: 5) {
                    HStack {
                        Text("B")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.indigo)
                        
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
                        ProfileView(isAuthenticated: $isAuthenticated, user: authenticatedUser)
                            .tabItem {
                                Label("Profile", systemImage: "person")
                            }
                    }
                    .accentColor(.indigo)
                }
            }
            else {
                SignInView(isAuthenticated: $isAuthenticated, authenticatedUser: $authenticatedUser)
            }
        }
    }
}

#Preview {
    ContentView()
}
