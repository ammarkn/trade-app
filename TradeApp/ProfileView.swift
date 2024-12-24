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
        ScrollView {
            VStack(spacing: 24) {
                VStack(spacing: 16) {
                    Image(user?.profileImage ?? "avatar-default-symbolic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                        .shadow(radius: 2)
                    
                    Text("\(user?.firstName ?? "N /") " + "\(user?.lastName ?? "A")")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.top, 20)
                
                VStack(spacing: 20) {
                    infoCard(title: "Username", value: user?.username ?? "N/A")
                    infoCard(title: "Email", value: user?.email ?? "N/A")
                    infoCard(title: "Neighbourhood", value: user?.neighbourhood ?? "N/A")
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button(action: signOut) {
                    HStack {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                        Text("Edit Profile")
                    }
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.indigo)
                }
                
                Button(action: signOut) {
                    HStack {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                        Text("Sign out")
                    }
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
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
    
    func signOut() {
        isAuthenticated = false
    }
}

#Preview {
    ProfileView(isAuthenticated: .constant(true), user: dummyUsers[0])
}
