//
//  BarterlyApp.swift
//  BarterlyApp
//
//  Created by Ammar Khan on 2024-12-18.
//

import SwiftUI
import FirebaseCore

@main
struct BarterlyApp: App {
    @State private var authService = AuthService()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authService)
        }
    }
}
