//
//  Tour.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import Foundation

struct Tour: Identifiable {
    var id: Int
    var name: String
    var location: String
    var description: String
    var imageName: String
    var isAvailable: Bool
}

let sampleTours = [
    Tour(id: 1, name: "Tour 1", location: "İstanbul", description: "İstanbul'un tarihini keşfedin", imageName: "tour1", isAvailable: true),
    Tour(id: 3, name: "Tour 3", location: "Pamukkale", description: "Travertenleri görmek ister miydiniz?", imageName: "tour3", isAvailable: true),
    Tour(id: 4, name: "Tour 4", location: "Efes Antik Kenti", description: "Efes'te antik tarihe yolculuk edin.", imageName: "tour4", isAvailable: true),
    Tour(id: 5, name: "Tour 5", location: "Antalya", description: "Deniz kenarında vakit geçirmek isterseniz...", imageName: "tour5", isAvailable: false),
]
