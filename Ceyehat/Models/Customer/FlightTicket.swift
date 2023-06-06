//
//  FlightTicket.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import Foundation

/// The `FlightTicket` model represents a flight ticket with an associated ID.
///
/// It includes the ticket's unique ID, an optional boarding pass ID, and an optional booking ID.
struct FlightTicket: Hashable, Codable, Identifiable {
    let id: String
    let name: String
    let surname: String
    let flightNumber: String
    let departureIata: String
    let departureName: String
    let arrivalIata: String
    let arrivalName: String
    let departureDate: String
    let arrivalDate: String
    let departureTime: String
    let arrivalTime: String
    let seatNumber: String?
    let price: Double
    let currency: String
    let status: String
    
    init(id: String, name: String, surname: String, flightNumber: String, departureIata: String, departureName: String, arrivalIata: String, arrivalName: String, departureDate: String, arrivalDate: String, departureTime: String, arrivalTime: String, seatNumber: String?, price: Double, currency: String, status: String) {
        self.id = id
        self.name = name
        self.surname = surname
        self.flightNumber = flightNumber
        self.departureIata = departureIata
        self.departureName = departureName
        self.arrivalIata = arrivalIata
        self.arrivalName = arrivalName
        self.departureDate = departureDate
        self.arrivalDate = arrivalDate
        self.departureTime = departureTime
        self.arrivalTime = arrivalTime
        self.seatNumber = seatNumber
        self.price = price
        self.currency = currency
        self.status = status
    }
}
