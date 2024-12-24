//
//  SearchView.swift
//  TradeApp
//
//  Created by Ammar Khan on 2024-12-18.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    var filteredResults: [Listing] {
        if searchText.isEmpty {
            return dummyListings
        }
        else {
            return dummyListings.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack{
                TextField("Search Barterly...", text: $searchText)
                    .padding(25)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                if filteredResults.isEmpty {
                    Text("No results found.")
                        .foregroundStyle(.secondary)
                        .padding(50)
                }
                else {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(filteredResults) { listing in
                                NavigationLink(destination: ListingDetailView(listing: listing)) {
                                    VStack{
                                        Image(listing.image)
                                            .resizable()
                                            .frame(width: 150, height: 120)
                                            .aspectRatio(contentMode: .fill)
                                            .cornerRadius(8)
                                        
                                        Text(listing.name)
                                            .font(.headline)
                                            .lineLimit(1)
                                        
                                        Text(listing.neighbourhood)
                                            .font(.subheadline)
                                            .foregroundStyle(.secondary)
                                    }
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                }
                Spacer()
            }
            .navigationTitle("Search")
        }
    }
}

#Preview {
    SearchView()
}
