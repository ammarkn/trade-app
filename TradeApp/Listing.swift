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
    let neighbourhood: String
    let category: String
    let description: String?
    let user: User
}

let dummyListings = [
    Listing(image: "bicycle", name: "BMX Bicycle", neighbourhood: "Downtown", category: "🚗 Transportation", description: "Looking to trade as I no longer have any space for it in my garage. This was purchased 2 months ago and is in good condition.", user: dummyUsers[0]),
    Listing(image: "laptop", name: "MacBook Air (2013)", neighbourhood: "North End", category: "📱 Electronics", description: nil, user: dummyUsers[1]),
    Listing(image: "lamp", name: "IKEA Table Lamp", neighbourhood: "South End", category: "🛏️ Furniture", description: nil, user: dummyUsers[0]),
    Listing(image: "chair", name: "Old Wooden Chair", neighbourhood: "Clayton Park", category: "🛏️ Furniture", description: nil, user: dummyUsers[1]),
    Listing(image: "laptop", name: "Dell XPS (2021)", neighbourhood: "Dartmouth", category: "📱 Electronics", description: nil, user: dummyUsers[0]),
    Listing(image: "laptop", name: "Google Chromebook (2019)", neighbourhood: "Downtown", category: "📱 Electronics", description: nil, user: dummyUsers[1]),
    Listing(image: "chair", name: "Herman Miller Chair", neighbourhood: "Upper Sackville", category: "🛏️ Furniture", description: nil, user: dummyUsers[0])
]
