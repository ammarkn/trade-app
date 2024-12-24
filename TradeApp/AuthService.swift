//
//  AuthService.swift
//  TradeApp
//
//  Created by Ammar Khan on 2024-12-24.
//

import Foundation
import FirebaseAuth

@MainActor
class AuthService: ObservableObject {
    @Published var currentUser: User?
    @Published var isAuthenticated = false
    
    func signUp(email: String, password: String, firstName: String, lastName: String) async throws {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        
        isAuthenticated = true
    }
    
    func signIn(email: String, password: String) async throws {
        _ = try await Auth.auth().signIn(withEmail: email, password: password)
        
        self.isAuthenticated = true
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            isAuthenticated = false
            currentUser = nil
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
