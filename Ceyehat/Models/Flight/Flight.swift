//
//  Flight.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import Foundation

/// The `Flight` model represents a single flight.
///
/// Each flight has a unique flight number, airline and aircraft names, departure and arrival times,
/// and ticket prices for economy, comfort, and business classes.
struct Flight: Hashable, Codable {
    let flightNumber: String
    let airlineName: String
    let aircraftName: String
    let departureHour: Date
    let arrivalHour: Date
    let economyPrice: Double
    let comfortPrice: Double
    let businessPrice: Double
    
    private enum CodingKeys: String, CodingKey {
        case flightNumber, airlineName, aircraftName, departureHour, arrivalHour, economyPrice, comfortPrice, businessPrice
    }
    
    /// Initializes a new instance of the `Flight` model.
    ///
    /// - Parameters:
    ///   - flightNumber: The unique flight number.
    ///   - airlineName: The name of the airline.
    ///   - aircraftName: The name of the aircraft.
    ///   - departureHour: The departure time of the flight.
    ///   - arrivalHour: The arrival time of the flight.
    ///   - economyPrice: The price of an economy class ticket.
    ///   - comfortPrice: The price of a comfort class ticket.
    ///   - businessPrice: The price of a business class ticket.
    init(flightNumber: String, airlineName: String, aircraftName: String, departureHour: Date, arrivalHour: Date, economyPrice: Double, comfortPrice: Double, businessPrice: Double) {
        self.flightNumber = flightNumber
        self.airlineName = airlineName
        self.aircraftName = aircraftName
        self.departureHour = departureHour
        self.arrivalHour = arrivalHour
        self.economyPrice = economyPrice
        self.comfortPrice = comfortPrice
        self.businessPrice = businessPrice
    }
    
    /// Initializes a new instance of the `Flight` model by decoding a JSON object.
    ///
    /// - Parameters:
    ///   - decoder: The decoder that decodes the JSON object.
    ///
    /// - Throws: An error if decoding fails.
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        flightNumber = try container.decode(String.self, forKey: .flightNumber)
        airlineName = try container.decode(String.self, forKey: .airlineName)
        aircraftName = try container.decode(String.self, forKey: .aircraftName)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let departureHourString = try container.decode(String.self, forKey: .departureHour)
        departureHour = dateFormatter.date(from: departureHourString)!
        
        let arrivalHourString = try container.decode(String.self, forKey: .arrivalHour)
        arrivalHour = dateFormatter.date(from: arrivalHourString)!
        
        economyPrice = try container.decode(Double.self, forKey: .economyPrice)
        comfortPrice = try container.decode(Double.self, forKey: .comfortPrice)
        businessPrice = try container.decode(Double.self, forKey: .businessPrice)
    }
}
