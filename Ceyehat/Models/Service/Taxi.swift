//
//  Taxi.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import Foundation

struct Taxi: Identifiable {
    var id: Int
    var name: String
    var location: String
    var isAvailable: Bool
    var imageName: String
    var ratePerKm: Double
}

let sampleTaxis = [
    Taxi(id: 1, name: "Taxi 1", location: "İstanbul", isAvailable: true, imageName: "taxi1", ratePerKm: 5.5),
    Taxi(id: 2, name: "Taxi 2", location: "İstanbul", isAvailable: false, imageName: "taxi2", ratePerKm: 4.3),
    Taxi(id: 3, name: "Taxi 3", location: "İzmir", isAvailable: true, imageName: "taxi3", ratePerKm: 4.7),
    Taxi(id: 4, name: "Taxi 4", location: "Antalya", isAvailable: true, imageName: "taxi4", ratePerKm: 3.8),
    Taxi(id: 5, name: "Taxi 5", location: "Ankara", isAvailable: false, imageName: "taxi5", ratePerKm: 3.6),
]

