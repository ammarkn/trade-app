//
//  SignInView.swift
//  TradeApp
//
//  Created by Ammar Khan on 2024-12-18.
//

import SwiftUI

struct SignInView: View {
    @Binding var isAuthenticated: Bool
    @Binding var authenticatedUser: User?
    @State private var username = ""
    @State private var password = ""
    @State private var message = ""
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("B")
                    .font(.system(size: 60))
                    .fontWeight(.bold)
                    .foregroundColor(.indigo)
                
                Text("Barterly")
                    .font(.system(size: 40))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            
            Text("Swap what you have for what you need.")
                .foregroundStyle(.secondary)
                .italic()
                .padding(.bottom, 25)
            
            TextField("Username", text: $username)
                .padding(5)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
            
            SecureField("Password", text: $password)
                .padding(5)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
            
            if !message.isEmpty {
                if(isAuthenticated == false) {
                    Text(message)
                        .foregroundStyle(.red)
                        .padding(.top, 10)
                }
                else {
                    Text(message)
                        .foregroundStyle(.green)
                        .padding(.top, 10)
                }
            }
            
            Button(action: signIn) {
                Text("Sign In")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.indigo)
                    .foregroundStyle(.white)
                    .cornerRadius(8)
            }
            .padding(.top, 20)
            Spacer()
            
            Button(action: register) {
                Text("Register")
            }
        }
        .padding()
        .navigationTitle("")
    }
    func signIn() {
        if let user = dummyUsers.first(where: { $0.username == username && $0.password == password}) {
            isAuthenticated = true
            authenticatedUser = user
            message = "Sign in successful."
        }
        else {
            isAuthenticated = false
            authenticatedUser = nil
            message = "Invalid username or password."
        }
    }
    
    func register() {

    }
}

#Preview {
    ContentView()
}
