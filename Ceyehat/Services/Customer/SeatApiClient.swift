//
//  SeatApiClient.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import Foundation

/// The `SeatApiClient` class handles the API calls related to seats.
///
/// It inherits from the `BaseApiClient` class and provides a method for fetching seat information.
class SeatApiClient: BaseApiClient {
    
    /// Fetches the seat information for a given flight number and aircraft name.
    ///
    /// - Parameters:
    ///   - flightNumber: The flight number as a string.
    ///   - aircraftName: The aircraft name as a string.
    ///   - completion: The completion closure to be called when the API call is completed.
    /// - Returns: An array of `Seat` objects or an error if the API call or decoding fails.
    func fetchSeats(flightNumber: String, aircraftName: String, completion: @escaping (Result<[Seat], Error>) -> Void) {
        let asciiFlightNumber = flightNumber.lowercased()
            .replacingOccurrences(of: "i", with: "i")
            .replacingOccurrences(of: "ı", with: "i")
            .replacingOccurrences(of: "ö", with: "o")
            .replacingOccurrences(of: "ü", with: "u")
            .replacingOccurrences(of: "ğ", with: "g")
            .replacingOccurrences(of: "ş", with: "s")
        
        let asciiAircraftName = aircraftName.lowercased()
            .replacingOccurrences(of: "i", with: "i")
            .replacingOccurrences(of: "ı", with: "i")
            .replacingOccurrences(of: "ö", with: "o")
            .replacingOccurrences(of: "ü", with: "u")
            .replacingOccurrences(of: "ğ", with: "g")
            .replacingOccurrences(of: "ş", with: "s")
        
        let urlStr = ApiEndpoints().getSeatUrl(flightNumber: asciiFlightNumber, aircraftName: asciiAircraftName)
        guard let url = URL(string: urlStr) else {
            return
        }
        
        let request = URLRequest(url: url)
        
        makeAPICall(url: url, request: request, completion: completion)
    }
}

