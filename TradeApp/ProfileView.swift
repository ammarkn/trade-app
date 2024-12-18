//
//  ProfileView.swift
//  TradeApp
//
//  Created by Ammar Khan on 2024-12-19.
//

import SwiftUI

struct ProfileView: View {
    @Binding var isAuthenticated: Bool
    let user: User?
    
    var body: some View {
        VStack {
            if let user = user {
                Text("Welcome, \(user.username)!")
                    .font(.largeTitle)
                    .padding()
                Text("Email: \(user.email)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            else {
                Text("User not found.")
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
                .padding()
            
            
            Button(action: signOut) {
                Text("Sign Out")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .foregroundStyle(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .padding()
        .navigationTitle("Profile")
    }
    
    func signOut() {
        isAuthenticated = false
    }
}

#Preview {
    ProfileView(isAuthenticated: .constant(true), user: dummyUsers[0])
}
