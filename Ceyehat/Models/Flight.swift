//
//  Flight.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import Foundation

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
