//
//  Offer.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 8.05.2023.
//

import Foundation
import SwiftUI

struct Offer: Hashable, Identifiable {
    let id = UUID()
    let title: String
    let color: UIColor
}

let specialOffers: [Offer] = [
    Offer(title: "Yaz İndirimi", color: .systemRed),
    Offer(title: "Son Dakika Fırsatları", color: .systemMint),
    Offer(title: "Şehir Tatili", color: .systemBlue),
    Offer(title: "Aile İndirimi", color: .systemTeal),
    Offer(title: "Erken Rezervasyon", color: .systemIndigo),
    Offer(title: "Yurt Dışı Turları", color: .systemOrange),
    Offer(title: "Kış Sporları İndirimi", color: .systemPink)
]
