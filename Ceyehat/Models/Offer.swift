//
//  Offer.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 8.05.2023.
//

import Foundation

struct Offer: Hashable, Identifiable {
    let id = UUID()
    let title: String
    let image: String
}

let specialOffers: [Offer] = [
    Offer(title: "Yaz İndirimi!", image: "giftcard.fill"),
    Offer(title: "Son Dakika Fırsatları", image: "giftcard.fill"),
    Offer(title: "Şehir Tatili", image: "giftcard.fill"),
    Offer(title: "Aile İndirimi", image: "giftcard.fill"),
    Offer(title: "Erken Rezervasyon", image: "giftcard.fill"),
    Offer(title: "Yurt Dışı Turları", image: "giftcard.fill"),
    Offer(title: "Kış Sporları İndirimi", image: "giftcard.fill")
]
