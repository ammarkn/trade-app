//
//  HomeView.swift
//  TradeApp
//
//  Created by Ammar Khan on 2024-12-18.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedCategory: String? = "All"
    
    var filteredListings: [Listing] {
        if let selectedCategory = selectedCategory, selectedCategory != "All" {
            return dummyListings.filter { $0.category == selectedCategory }
        }
        else {
            return dummyListings
        }
    }
    let columns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]
    
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(["All"] + ["📱 Electronics", "🛏️ Furniture", "🚗 Transportation"], id: \.self) { category in
                            Button(action: {
                                if category == "All" {
                                    selectedCategory = "All"
                                } else if selectedCategory == category {
                                    selectedCategory = "All"
                                } else {
                                    selectedCategory = category
                                }
                            }) {
                                Text(category)
                                    .font(.headline)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 12)
                                    .background(
                                        Capsule()
                                            .fill(selectedCategory == category ? Color.indigo.opacity(0.2) : Color.gray.opacity(0.1))
                                    )
                                    .foregroundStyle(selectedCategory == category ? .indigo : .black)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }
                LazyVGrid(columns: [
                    GridItem(.fixed(UIScreen.main.bounds.width / 2), spacing: 1),
                    GridItem(.fixed(UIScreen.main.bounds.width / 2), spacing: 0)
                ], spacing: 1) {
                    ForEach(filteredListings) { listing in
                        NavigationLink(destination: ListingDetailView(listing: listing)) {
                            ZStack(alignment: .bottom) {
                                Image(listing.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2)
                                    .clipped()
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(listing.name)
                                        .font(.headline)
                                        .lineLimit(2)
                                    
                                    Text(listing.neighbourhood)
                                        .font(.subheadline)
                                        .lineLimit(1)
                                }
                                .foregroundStyle(.white)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            .black.opacity(1),
                                            .black.opacity(0)
                                        ]),
                                        startPoint: .bottom,
                                        endPoint: .top
                                    )
                                )
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal, 0)
            }
            .navigationTitle("")
//            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    HomeView()
}
