//
//  FoodService.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import Foundation

struct FoodService: Identifiable {
    var id: Int
    var name: String
    var cuisine: String
    var deliveryTime: Int
    var rating: Double
    var imageName: String
    var isAvailable: Bool
}

let sampleFoodServices = [
    FoodService(id: 1, name: "Restaurant 1", cuisine: "Turkish", deliveryTime: 30, rating: 4.5, imageName: "restaurant1", isAvailable: true),
    FoodService(id: 2, name: "Restaurant 2", cuisine: "Italian", deliveryTime: 45, rating: 4.0, imageName: "restaurant2", isAvailable: false),
    FoodService(id: 3, name: "Restaurant 3", cuisine: "Mexican", deliveryTime: 25, rating: 4.8, imageName: "restaurant3", isAvailable: true),
    FoodService(id: 4, name: "Restaurant 4", cuisine: "Chinese", deliveryTime: 40, rating: 4.2, imageName: "restaurant4", isAvailable: true),
    FoodService(id: 5, name: "Restaurant 5", cuisine: "Indian", deliveryTime: 35, rating: 4.6, imageName: "restaurant5", isAvailable: false),
]

