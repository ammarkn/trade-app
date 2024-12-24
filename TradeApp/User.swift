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
    let firstName: String
    let lastName: String
    let email: String
    let profileImage: String?
    let neighbourhood: String
}

let dummyUsers = [
    User(username: "ammarkn", password: "test123", firstName: "Ammar", lastName: "Khan", email: "ammarkhan5@yahoo.com", profileImage: "ammar-profile-photo", neighbourhood: "South End"),
    User(username: "john_doe", password: "test456", firstName: "John", lastName: "Khan", email: "john_doe@example.com", profileImage: nil, neighbourhood: "Bedford")
]