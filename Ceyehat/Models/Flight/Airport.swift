//
//  Airport.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import Foundation

/// The `Airport` model represents an airport.
///
/// Each airport has a name, an IATA code, a city name, and a country name.
struct Airport: Hashable, Codable {
    let name: String
    let iataCode: String
    let cityName: String
    let countryName: String
    
    /// Initializes a new instance of the `Airport` model.
    ///
    /// - Parameters:
    ///   - name: The name of the airport.
    ///   - iataCode: The IATA code of the airport.
    ///   - cityName: The name of the city the airport is located in.
    ///   - countryName: The name of the country the airport is located in.
    init(name: String, iataCode: String, cityName: String, countryName: String) {
        self.name = name
        self.iataCode = iataCode
        self.cityName = cityName
        self.countryName = countryName
    }
}
