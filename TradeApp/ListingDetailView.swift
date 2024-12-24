//
//  ListingDetailView.swift
//  TradeApp
//
//  Created by Ammar Khan on 2024-12-18.
//

import SwiftUI

struct ListingDetailView: View {
    var listing: Listing
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(listing.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: UIScreen.main.bounds.width)
                    .frame(height: 300)
                    .clipped()
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                .clear,
                                .black.opacity(0.2)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                VStack(alignment: .leading, spacing: 16) {
                    HStack(alignment: .top, spacing: 8) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(listing.name)
                                .font(.title)
                                .fontWeight(.bold)
                            Text(listing.neighbourhood)
                                .font(.title3)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        Divider()
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 4) {
                            Text("Trade by:")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            HStack(spacing: 6) {
                                Text(listing.user.firstName)
                                    .font(.headline)
                                    .fontWeight(.light)
                                    .fontWeight(.medium)
                                
                                Image(listing.user.profileImage ?? "avatar-default-symbolic")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 32, height: 32)
                                    .clipShape(Circle())
                                    .overlay(Circle()
                                        .stroke(Color.gray.opacity(0.2), lineWidth: 1))
                            }
                        }
                    }
                    
                    Divider()
                
                    Text("Description")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(listing.description ?? "No description available.")
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text("Category")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(listing.category)
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
            .padding(.vertical)
        }
        .navigationTitle("Details")
//        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ListingDetailView(listing: dummyListings[0])
}
