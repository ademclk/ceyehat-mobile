//
//  AirportApiClient.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import Foundation

/// The `AirportApiClient` class handles the API calls related to airports.
///
/// It inherits from the `BaseApiClient` class and provides methods for fetching
/// and searching airports.
class AirportApiClient: BaseApiClient {
    
    /// Fetches a list of airports from the API.
    ///
    /// - Parameters:
    ///   - completion: The completion closure to be called when the API call is completed.
    /// - Returns: An array of `Airport` objects or an error if the API call or decoding fails.
    func getAirports(completion: @escaping (Result<[Airport], Error>) -> Void) {
        guard let url = URL(string: ApiEndpoints().getAirportUrl()) else {
            return
        }
        
        let request = URLRequest(url: url)
        makeAPICall(url: url, request: request, completion: completion)
    }
    
    /// Searches for airports based on the provided search term.
    ///
    /// - Parameters:
    ///   - searchTerm: The search term to use for finding airports.
    ///   - completion: The completion closure to be called when the API call is completed.
    /// - Returns: An array of `Airport` objects or an error if the API call or decoding fails.
    func searchAirport(searchTerm: String, completion: @escaping (Result<[Airport], Error>) -> Void) {
        let asciiSearchTerm = searchTerm.lowercased()
            .replacingOccurrences(of: "i", with: "i")
            .replacingOccurrences(of: "ı", with: "i")
            .replacingOccurrences(of: "ö", with: "o")
            .replacingOccurrences(of: "ü", with: "u")
            .replacingOccurrences(of: "ğ", with: "g")
            .replacingOccurrences(of: "ş", with: "s")
        
        guard let url = URL(string: ApiEndpoints().searchAirportUrl(searchTerm: asciiSearchTerm)) else {
            return
        }
        
        let request = URLRequest(url: url)
        makeAPICall(url: url, request: request, completion: completion)
    }
}

