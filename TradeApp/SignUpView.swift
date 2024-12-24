//
//  SignUpView.swift
//  
//
//  Created by Ammar Khan on 2024-12-25.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var authService: AuthService
    @Environment(\.dismiss) var dismiss
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var showError = false
    @State private var errorMessage = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Spacer()
                VStack(spacing: 8) {
                    Spacer()
                    Text("Create Account")
                        .font(.title)
                        .fontWeight(.bold)
                    
//                    Text("Join Barterly today!")
//                        .foregroundStyle(.secondary)
                    
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
                }
                
                VStack(spacing: 16) {
                    TextField("First Name", text: $firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textContentType(.givenName)
                        .textInputAutocapitalization(.words)
                    
                    TextField("Last Name", text: $lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textContentType(.familyName)
                        .textInputAutocapitalization(.words)

                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textContentType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textContentType(.newPassword)
                    
                    SecureField("Confirm Password", text: $confirmPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textContentType(.newPassword)
                }
                
                Button(action: signUp) {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.indigo)
                        .cornerRadius(8)
                }
                .padding(.top, 8)
                
                HStack(spacing: 5) {
                    Text("Already have an account?")
                        .foregroundStyle(.secondary)
                    Button(action: { dismiss() }) {
                        Text("Sign In")
                    }
                }
            }
            .padding()
        }
        .alert("Error", isPresented: $showError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(errorMessage)
        }
    }
    
    private func signUp() {
        guard !firstName.isEmpty, !lastName.isEmpty else {
            showError = true
            errorMessage = "First name and last name are required."
            return
        }
        
        guard !email.isEmpty else {
            showError = true
            errorMessage = "Email is required."
            return
        }
        
        guard password == confirmPassword else {
            showError = true
            errorMessage = "Passwords must match."
            return
        }
        
        guard password.count >= 6 else {
            showError = true
            errorMessage = "Password must be at least 6 characters."
            return
        }
        
        Task {
            do {
                try await authService.signUp(
                    email: email,
                    password: password,
                    firstName: firstName,
                    lastName: lastName
                )
            } catch {
                showError = true
                errorMessage = error.localizedDescription
            }
        }
    }
}

#Preview {
    SignUpView()
}
