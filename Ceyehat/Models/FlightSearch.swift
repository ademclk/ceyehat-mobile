//
//  FlightSearch.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

/// The `FlightSearch` model represents a flight search request.
///
/// It includes the departure and arrival airports, departure and return dates, and the number of passengers.
struct FlightSearch: Codable {
    let departureAirportIataCode: String
    let arrivalAirportIataCode: String
    let departureDate: String
    let returnDate: String?
    let passengerCount: Int
}
