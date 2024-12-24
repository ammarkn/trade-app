//
//  Chat.swift
//  TradeApp
//
//  Created by Ammar Khan on 2024-12-24.
//

import Foundation

struct Chat: Identifiable {
    let id = UUID()
    let listing: Listing
    let otherUser: User
    var messages: [Message]
    var lastMessageTimeStamp: Date {
        messages.last?.timestamp ?? Date()
    }
    
    static let dummyChats = [
        Chat(listing: dummyListings[0],
             otherUser: dummyUsers[1],
             messages: Message.dummyMessages),
        Chat(listing: dummyListings[1],
             otherUser: dummyUsers[0],
             messages: Message.dummyMessages),
        // Empty chat
        Chat(listing: dummyListings[2],
             otherUser: dummyUsers[2],
             messages: [])
    ]
}
