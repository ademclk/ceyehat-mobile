//
//  WeatherKitManager.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 11.05.2023.
//

import Foundation
import WeatherKit

@MainActor class WeatherKitManager: ObservableObject {
    
    @Published var weather: Weather?
    
    func getWeather(latitude: Double, longitude: Double) async {
        do {
            weather = try await Task.detached(priority: .userInitiated) {
                return try await WeatherService.shared.weather(for: .init(latitude: latitude, longitude: longitude))
            }.value
        } catch {
            fatalError("\(error)")
        }
    }
    
    var symbol: String {
        weather?.currentWeather.symbolName ?? "xmark.app"
    }
    
    var temp: String {
        if let temp = weather?.currentWeather.temperature.converted(to: .celsius) {
            let formattedTemp = String(format: "%.1f", temp.value)
            return "\(formattedTemp)°C"
        } else {
            return "Hava durumu bilgisi alınıyor..."
        }
    }
}
