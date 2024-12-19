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
                    Text(listing.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text(listing.neighborhood)
                        .font(.title2)
                        .foregroundStyle(.secondary)
                    
                    Divider()
                
                    Text("Description")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(listing.description ?? "No description available.")
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
