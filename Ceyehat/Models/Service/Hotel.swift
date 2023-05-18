//
//  Hotel.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import Foundation

struct Hotel: Identifiable {
    let id: Int
    let name: String
    let location: String
    let price: Double
    let stars: Int
    let isRecommended: Bool
}

let sampleHotels: [Hotel] = [
    Hotel(id: 1, name: "Otel 1", location: "İstanbul", price: 500, stars: 5, isRecommended: true),
    Hotel(id: 2, name: "Otel 2", location: "Ankara", price: 300, stars: 4, isRecommended: false),
    Hotel(id: 3, name: "Otel 3", location: "İzmir", price: 400, stars: 5, isRecommended: true),
    Hotel(id: 4, name: "Otel 4", location: "Antalya", price: 200, stars: 3, isRecommended: false),
    Hotel(id: 5, name: "Otel 5", location: "Bursa", price: 150, stars: 2, isRecommended: false),
]

