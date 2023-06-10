//
//  WeatherKitManager.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 11.05.2023.
//

import Foundation
import WeatherKit

class WeatherKitManager: ObservableObject {
    @Published var weather: Weather?
    @Published var isFetchingWeather = false
    
    func getWeather(
        latitude: Double,
        longitude: Double) async {
        do {
            let receivedWeather = try await WeatherService.shared.weather(for: .init(latitude: latitude, longitude: longitude))
            DispatchQueue.main.async {
                self.weather = receivedWeather
            }
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
            return "Yükleniyor..."
        }
    }
}
