//
//  Message.swift
//  TradeApp
//
//  Created by Ammar Khan on 2024-12-24.
//

import Foundation

struct Message: Identifiable {
    let id = UUID()
    let content: String
    let timestamp: Date
    let isFromMe: Bool
    
    static let dummyMessages = [
        Message(content: "Hi, is this still available?", timestamp: Date().addingTimeInterval(-86400), isFromMe: true),
        Message(content: "Yes, it is!", timestamp: Date().addingTimeInterval(-85400), isFromMe: false),
        Message(content: "When can we meet?", timestamp: Date().addingTimeInterval(-84400), isFromMe: true)
    ]
}
