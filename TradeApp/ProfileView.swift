//
//  ProfileView.swift
//  TradeApp
//
//  Created by Ammar Khan on 2024-12-19.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authService: AuthService
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                VStack(spacing: 16) {
                    Image("avatar-default-symbolic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                        .shadow(radius: 2)
                    
                    Text("FirstName LastName")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.top, 20)
                
                VStack(spacing: 20) {
                    infoCard(title: "Username", value: "Username here")
                    infoCard(title: "Email", value: "Email here")
                    infoCard(title: "Neighbourhood", value: "Neighbourhood here")
                }
                .padding(.horizontal)
                                
                Button(action: {}) {
                    HStack {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                        Text("Edit Profile")
                    }
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.indigo)
                    .cornerRadius(8)
                }
                
                Button(action: {
                    authService.signOut()
                }) {
                    HStack {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                        Text("Sign Out")
                    }
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(8)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    private func infoCard(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            Text(value)
                .font(.body)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthService())
}
