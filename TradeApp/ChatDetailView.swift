//
//  ChatDetailView.swift
//  TradeApp
//
//  Created by Ammar Khan on 2024-12-24.
//

import SwiftUI

struct ChatDetailView: View {
    let chat : Chat
    @State private var messageText = ""
    @State private var messages : [Message]
    
    init(chat: Chat) {
        self.chat = chat
        _messages = State(initialValue: chat.messages)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(messages) { message in
                        MessageBubbleView(message: message)
                    }
                }
                .padding()
            }
            
            if messages.isEmpty {
                Text("No messages yet. Start a conversation to get trading!")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            
            HStack {
                TextField("Type your message here...", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button(action: sendMessage) {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.system(size: 24))
                        .foregroundStyle(.indigo)
                }
                .padding(.trailing)
                .disabled(messageText.isEmpty)
            }
            .padding(.vertical, 8)
            .backgroundStyle(Color(.systemBackground))
            .shadow(radius: 1)
        }
        .navigationTitle(chat.otherUser.firstName)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func sendMessage() {
        let newMessage = Message(
            content: messageText,
            timestamp: Date(),
            isFromMe: true
        )
        messages.append(newMessage)
        messageText = ""
    }
}

struct MessageBubbleView: View {
    let message: Message
    var body: some View {
        HStack {
            if message.isFromMe {
                Spacer()
                Text("D/T")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Text(message.content)
                .padding(12)
                .background(message.isFromMe ? Color.indigo : Color(.systemGray5))
                .foregroundStyle(message.isFromMe ? .white : .primary)
                .cornerRadius(16)
            
            if !message.isFromMe {
                Spacer()
                Text("D/T")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    NavigationView {
        ChatDetailView(chat: Chat(
            listing: dummyListings[0],
            otherUser: dummyUsers[1],
            messages: [
                Message(
                    content: "Hi, is this still available?",
                    timestamp: Date().addingTimeInterval(-86400),
                    isFromMe: true
                ),
                Message(
                    content: "Yes, it is! Are you interested?",
                    timestamp: Date().addingTimeInterval(-85400),
                    isFromMe: false
                ),
                Message(
                    content: "Great! Would you be willing to meet at Central Park?",
                    timestamp: Date().addingTimeInterval(-84400),
                    isFromMe: true
                ),
                Message(
                    content: "Sure, how about tomorrow at 2 PM?",
                    timestamp: Date().addingTimeInterval(-83400),
                    isFromMe: false
                ),
                Message(
                    content: "Perfect, see you there!",
                    timestamp: Date().addingTimeInterval(-82400),
                    isFromMe: true
                )
            ]
        ))
    }
}

#Preview("Empty Chat") {
    NavigationView {
        ChatDetailView(chat: Chat(
            listing: dummyListings[1],
            otherUser: dummyUsers[0],
            messages: []
        ))
    }
}

#Preview("Long Messages") {
    NavigationView {
        ChatDetailView(chat: Chat(
            listing: dummyListings[2],
            otherUser: dummyUsers[1],
            messages: [
                Message(
                    content: "Hi, I'm interested in this item but I have a few questions about its condition. Could you tell me more about how long you've had it and if there are any issues I should know about?",
                    timestamp: Date().addingTimeInterval(-3600),
                    isFromMe: true
                ),
                Message(
                    content: "Of course! I've owned it for about 6 months and it's in excellent condition. I've always kept it in a protective case and there are no scratches or damages. Let me know if you'd like to see more photos!",
                    timestamp: Date().addingTimeInterval(-3500),
                    isFromMe: false
                )
            ]
        ))
    }
}
