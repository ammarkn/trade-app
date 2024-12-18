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
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Button(action: {
                            selectedCategory = "All"
                        }) {
                            Text("All")
                                .font(.headline)
                                .padding(8)
                                .background(
                                    selectedCategory == "All" ? Color.blue.opacity(0.2) : Color.clear
                                )
                                .cornerRadius(8)
                                .foregroundStyle(selectedCategory == "All" ? .blue : .black)
                        }
                        ForEach(["📱 Electronics", "🛏️ Furniture", "🚗 Transportation"], id: \.self) { category in
                            Button(action: {
                                if selectedCategory == category {
                                    selectedCategory = nil
                                }
                                else {
                                    selectedCategory = category
                                }
                            }) {
                                Text(category)
                                    .font(.headline)
                                    .padding(8)
                                    .background(
                                        selectedCategory == category ? Color.blue.opacity(0.2) : Color.clear
                                    )
                                    .cornerRadius(8)
                                    .foregroundStyle(selectedCategory == category ? .blue : .black)
                            }
                        }
                    }
                    .padding()
                }
                LazyVGrid(columns: columns, spacing:  16) {
                    ForEach(filteredListings) { listing in
                        NavigationLink(destination: ListingDetailView(listing: listing)) {
                            VStack {
                                Image(listing.image)
                                    .resizable()
                                    .frame(width: 150, height: 120)
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(8)
                                
                                Text(listing.name)
                                    .font(.headline)
                                    .lineLimit(1)
                                
                                Text(listing.neighborhood)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                    .lineLimit(1)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .navigationTitle("")
        }
    }
}

#Preview {
    HomeView()
}
