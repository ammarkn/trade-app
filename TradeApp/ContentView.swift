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
                    HStack(spacing: 5) {
                        Text("฿")
//                            .font(.largeTitle)
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .foregroundStyle(.indigo)
                        Text("Barterly")
//                            .font(.title)
                            .font(.system(size: 35))
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    }
                    .padding(.top, 8)
                    
                    TabView {
                        HomeView()
                            .tabItem {
                                Label("Home", systemImage: "house")
                            }
                            .accessibilityLabel("Home Tab")
                        SearchView()
                            .tabItem {
                                Label("Search", systemImage: "magnifyingglass")
                            }
                            .accessibilityLabel("Search Tab")
                        Text("Create")
                            .tabItem {
                                Label("Create", systemImage: "plus")
                            }
                            .accessibilityLabel("Create Post Tab")
                        ChatsView()
                            .tabItem {
                                Label("Chats", systemImage: "message")
                            }
                            .accessibilityLabel( "Chats Tab")
                        ProfileView(isAuthenticated: $isAuthenticated, user: authenticatedUser)
                            .tabItem {
                                Label("Profile", systemImage: "person")
                            }
                            .accessibilityLabel( "Profile Tab")
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
