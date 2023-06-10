//
//  FlightApiClient.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import Foundation

/// The `FlightApiClient` class handles the API calls related to flights.
///
/// It inherits from the `BaseApiClient` class and provides a method for searching flights.
class FlightApiClient: BaseApiClient {
    
    let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    /// Searches for flights based on the provided flight search parameters.
    ///
    /// - Parameters:
    ///   - flightSearch: The flight search parameters.
    ///   - completion: The completion closure to be called when the API call is completed.
    /// - Returns: An array of `Flight` objects or an error if the API call or decoding fails.
    func searchFlights(
        flightSearch: FlightSearch,
        completion: @escaping (Result<[Flight], Error>) -> Void) {
        let url = URL(string: ApiEndpoints().searchFlightUrl())!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(flightSearch)
            request.httpBody = jsonData
        } catch {
            print("Flight search encoding failed: \(error.localizedDescription)")
            return
        }
        
        makeAPICall(url: url, request: request, completion: completion)
    }
}

