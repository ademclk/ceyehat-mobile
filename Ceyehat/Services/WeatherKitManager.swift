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
    
    
    func getWeather() async {
        do {
            weather = try await Task.detached(priority: .userInitiated) {
                return try await WeatherService.shared.weather(for: .init(latitude: 37.322998, longitude: -122.032181)) 
            }.value
        } catch {
            fatalError("\(error)")
        }
    }
    
    var symbol: String {
        weather?.currentWeather.symbolName ?? "xmark"
    }
    
    var temp: String {
        let temp =
        weather?.currentWeather.temperature
        
        let convert = temp?.converted(to: .fahrenheit).description
        return convert ?? "Loading Weather Data"
        
    }
    
}
