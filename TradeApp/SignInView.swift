//
//  SignInView.swift
//  TradeApp
//
//  Created by Ammar Khan on 2024-12-18.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var authService: AuthService
    @State private var email = ""
    @State private var password = ""
    @State private var showError = false
    @State private var errorMessage = ""
    @State private var showSignUp = false
    
//    @Binding var isAuthenticated: Bool
//    @Binding var authenticatedUser: User?
//    @State private var username = ""
//    @State private var password = ""
//    @State private var message = ""
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 5) {
                Text("฿")
                    .font(.system(size: 60))
                    .fontWeight(.bold)
                    .foregroundStyle(.indigo)
                
                Text("Barterly")
                    .font(.system(size: 55))
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
            }
            
            Text("Swap what you have for what you need.")
                .foregroundStyle(.secondary)
                .italic()
                .padding(.bottom, 25)
            
            TextField("Email", text: $email)
                .padding(5)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
            
            SecureField("Password", text: $password)
                .padding(5)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
            
            Button("Sign In") {
                Task {
                    do {
                        try await authService.signIn(email: email, password: password)
                    } catch {
                        showError = true
                        errorMessage = error.localizedDescription
                    }
                }
            }
            .alert("Error", isPresented: $showError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
            .font(.headline)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.indigo)
            .foregroundStyle(.white)
            .cornerRadius(8)
            .padding(.top, 16)
            
            Spacer()
            
            HStack(spacing: 5) {
                Text("Don't have an account?")
                    .foregroundStyle(.secondary)
                Button(action: { showSignUp = true }) {
                    Text("Sign Up")
                }
                .sheet(isPresented: $showSignUp) {
                    SignUpView()
                        .environmentObject(authService)
                }
            }
        }
        .padding()
        .navigationTitle("")
    }
    
    func register() {

    }
}

#Preview {
    SignInView()
        .environmentObject(AuthService())
}
