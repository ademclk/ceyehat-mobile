//
//  Car.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import Foundation

struct Car: Identifiable {
    var id: Int
    var name: String
    var manufacturer: String
    var pricePerDay: Double
    var image: String
    var isAvailable: Bool
}

let sampleCars: [Car] = [
    Car(id: 1, name: "Model S", manufacturer: "Tesla", pricePerDay: 1200.0, image: "tesla_model_s", isAvailable: true),
    Car(id: 2, name: "3 Series", manufacturer: "BMW", pricePerDay: 800.0, image: "bmw_3_series", isAvailable: true),
    Car(id: 3, name: "Civic", manufacturer: "Honda", pricePerDay: 500.0, image: "honda_civic", isAvailable: false),
    Car(id: 4, name: "A4", manufacturer: "Audi", pricePerDay: 900.0, image: "audi_a4", isAvailable: true),
    Car(id: 5, name: "Model 3", manufacturer: "Tesla", pricePerDay: 1000.0, image: "tesla_model_3", isAvailable: true),
    Car(id: 6, name: "E-Class", manufacturer: "Mercedes", pricePerDay: 1300.0, image: "mercedes_e_class", isAvailable: false),
    Car(id: 7, name: "Camry", manufacturer: "Toyota", pricePerDay: 600.0, image: "toyota_camry", isAvailable: true),
    Car(id: 8, name: "Mustang", manufacturer: "Ford", pricePerDay: 1400.0, image: "ford_mustang", isAvailable: true),
    Car(id: 9, name: "Impreza", manufacturer: "Subaru", pricePerDay: 700.0, image: "subaru_impreza", isAvailable: false),
    Car(id: 10, name: "Model X", manufacturer: "Tesla", pricePerDay: 1500.0, image: "tesla_model_x", isAvailable: true),
]

