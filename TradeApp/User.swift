//
//  User.swift
//  TradeApp
//
//  Created by Ammar Khan on 2024-12-18.
//

import Foundation

struct User {
    let id = UUID()
    let username: String
    let password: String
    let email: String
}

let dummyUsers = [
    User(username: "ammarkn", password: "test123", email: "ammarkhan5@yahoo.com"),
    User(username: "john_doe", password: "test456", email: "john_doe@example.com")
]
