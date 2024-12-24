//
//  ChatsView.swift
//  TradeApp
//
//  Created by Ammar Khan on 2024-12-24.
//

import SwiftUI

struct ChatsView: View {
    @State private var chats = Chat.dummyChats
    
    var body: some View {
        List(chats) { chat in
            NavigationLink(destination: ChatDetailView(chat: chat)) {
                ChatRowView(chat: chat)
            }
        }
        .navigationTitle("Chats")
    }
}

struct ChatRowView: View {
    let chat: Chat
    
    var body : some View {
        HStack(spacing: 12) {
            Image(chat.otherUser.profileImage ?? "avatar-default-symbolic")
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(chat.otherUser.firstName + " " + chat.otherUser.lastName)
                    .font(.headline)
                Text(chat.messages.last?.content ?? "")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .lineLimit(1)
            }
            
            Spacer()
            
            Text(chat.lastMessageTimeStamp, style: .relative)
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .padding(.vertical, 8)
    }
    
}

#Preview {
    ChatsView()
}
