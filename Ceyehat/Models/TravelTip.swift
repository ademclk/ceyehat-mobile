//
//  TravelTip.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 8.05.2023.
//

import Foundation

struct TravelTip: Hashable, Identifiable {
    let id = UUID()
    let title: String
    let image: String
}

let sampleTravelTips: [TravelTip] = [
    TravelTip(title: "Yurt Dışında Telefon Kullanımı", image: "phone.and.waveform"),
    TravelTip(title: "Otel Nasıl Seçilir", image: "house.lodge"),
    TravelTip(title: "Doğru Seyahat Sigortası Nasıl Seçilir", image: "checkmark.circle"),
    TravelTip(title: "Yolculuk Sırasında Sağlık", image: "heart"),
    TravelTip(title: "Uygun Fiyata Uçak Bileti Nasıl Bulunur", image: "ticket"),
    TravelTip(title: "Para ve Pasaport Nasıl Saklanır", image: "magsafe.batterypack")
]
