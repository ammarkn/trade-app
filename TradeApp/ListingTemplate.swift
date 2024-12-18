//
//  ListingTemplate.swift
//  TradeApp
//
//  Created by Ammar Khan on 2024-12-18.
//

import Foundation

struct Listing: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let neighborhood: String
    let category: String
    let description: String?
}

let dummyListings = [
    Listing(image: "bicycle", name: "BMX Bicycle", neighborhood: "Downtown", category: "🚗 Transportation", description: "Looking to trade as I no longer have any space for it in my garage. This was purchased 2 months ago and is in good condition."),
    Listing(image: "laptop", name: "MacBook Air (2013)", neighborhood: "North End", category: "📱 Electronics", description: nil),
    Listing(image: "lamp", name: "IKEA Table Lamp", neighborhood: "South End", category: "🛏️ Furniture", description: nil),
    Listing(image: "chair", name: "Old Wooden Chair", neighborhood: "Clayton Park", category: "🛏️ Furniture", description: nil),
    Listing(image: "laptop", name: "Dell XPS (2021)", neighborhood: "Dartmouth", category: "📱 Electronics", description: nil),
    Listing(image: "laptop", name: "Google Chromebook (2019)", neighborhood: "Downtown", category: "📱 Electronics", description: nil),
]
