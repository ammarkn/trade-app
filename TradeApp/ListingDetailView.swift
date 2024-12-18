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
            VStack(alignment: .leading, spacing: 10) {
                Image(listing.image)
                    .resizable()
                    .frame(height: 250)
                    .aspectRatio(contentMode: .fill)
                    .scaledToFit()
                
                Text(listing.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                
                Text(listing.neighborhood)
                    .font(.title2)
                    .foregroundStyle(.secondary)
                
                Divider()
                
                Text("Description")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, 15)
                
                Text(listing.description ?? "No description available.")
                    .font(.body)
                    .foregroundStyle(.secondary)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Details")
    }
}

#Preview {
    ListingDetailView(listing: dummyListings[0])
}
