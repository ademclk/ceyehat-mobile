//
//  FeaturedCity.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 9.05.2023.
//

import Foundation
import MapKit

struct FeaturedCity: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let coordinate: CLLocationCoordinate2D
}

let sampleFeaturedCities: [FeaturedCity] = [
    FeaturedCity(name: "İstanbul", image: "istanbul", coordinate: CLLocationCoordinate2D(latitude: 41.0082, longitude: 28.9784)),
    FeaturedCity(name: "New York", image: "new_york", coordinate: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060)),
    FeaturedCity(name: "Paris", image: "paris", coordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)),
    FeaturedCity(name: "Tokyo", image: "tokyo", coordinate: CLLocationCoordinate2D(latitude: 35.6895, longitude: 139.6917)),
]

