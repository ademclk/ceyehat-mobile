//
//  Category.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 10.05.2023.
//

import Foundation

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let iconName: String
}

let sampleCategories = [
    Category(name: "Tarihi Yerler", iconName: "clock.arrow.circlepath"),
    Category(name: "Plajlar", iconName: "beach.umbrella"),
    Category(name: "Doğa Aktiviteleri", iconName: "leaf.arrow.circlepath"),
    Category(name: "Gastronomi", iconName: "fork.knife.circle")
]
