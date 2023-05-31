//
//  TourGuide.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import Foundation

struct TourGuide: Identifiable {
    var id: Int
    var name: String
    var specialization: String
    var experience: Int
    var imageName: String
    var isAvailable: Bool
}

let sampleTourGuides = [
    TourGuide(id: 1, name: "Rehber 1", specialization: "Tarih", experience: 5, imageName: "guide1", isAvailable: true),
    TourGuide(id: 2, name: "Rehber 2", specialization: "Doğa", experience: 3, imageName: "guide2", isAvailable: false),
    TourGuide(id: 3, name: "Rehber 3", specialization: "Kültür", experience: 7, imageName: "guide3", isAvailable: true),
    TourGuide(id: 4, name: "Rehber 4", specialization: "Müze", experience: 4, imageName: "guide4", isAvailable: true),
    TourGuide(id: 5, name: "Rehber 5", specialization: "Yemek", experience: 2, imageName: "guide5", isAvailable: false),
]
