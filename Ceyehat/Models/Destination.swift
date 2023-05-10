//
//  Destination.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 10.05.2023.
//

import Foundation

struct Destination: Identifiable {
    let id = UUID()
    let name: String
    let image: String
}

let sampleTrendingDestinations = [
    Destination(name: "İstanbul", image: "mappin.and.ellipse"),
    Destination(name: "Antalya", image: "mappin.and.ellipse"),
    Destination(name: "İzmir", image: "mappin.and.ellipse"),
    Destination(name: "Ankara", image: "mappin.and.ellipse")
]

let sampleTopAttractions = [
    Destination(name: "Ayasofya", image: "star.fill"),
    Destination(name: "Kapadokya", image: "star.fill"),
    Destination(name: "Efes", image: "star.fill"),
    Destination(name: "Pamukkale", image: "star.fill")
]

let sampleRecommendedItineraries = [
    Destination(name: "İstanbul 3 Gün", image: "calendar"),
    Destination(name: "Antalya 5 Gün", image: "calendar"),
    Destination(name: "İzmir 4 Gün", image: "calendar"),
    Destination(name: "Ankara 2 Gün", image: "calendar")
]
