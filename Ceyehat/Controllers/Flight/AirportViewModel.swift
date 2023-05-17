//
//  AirportViewModel.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 8.05.2023.
//

import Foundation

/// The `AirportViewModel` class is an `ObservableObject` responsible for handling the view model layer for airport-related data.
///
/// It provides functionality for fetching and searching for airports.
class AirportViewModel: ObservableObject {
    
    /// An array of `Airport` objects representing the airports to be displayed.
    @Published var airports: [Airport] = []
    
    @Published var isLoading: Bool = false
    
    /// An instance of `AirportApiClient` for making API calls related to airports.
    private let airportApiClient = AirportApiClient()
    
    /// Fetches the airports from the server and updates the `airports` array.
    ///
    /// In case of success, the fetched airports are assigned to the `airports` array, and in case of an error, the error is printed to the console.
    func getAirports() {
        airportApiClient.getAirports { [weak self] result in
            switch result {
            case .success(let airports):
                DispatchQueue.main.async {
                    self?.airports = airports
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    /// Searches for airports based on the provided search term and updates the `airports` array.
    ///
    /// - Parameter searchTerm: The search term as a string.
    ///
    /// In case of success, the found airports are assigned to the `airports` array, and in case of an error, the error is printed to the console.
    func searchAirport(searchTerm: String) {
        airportApiClient.searchAirport(searchTerm: searchTerm) { [weak self] result in
            switch result {
            case .success(let airports):
                DispatchQueue.main.async {
                    self?.airports = airports
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
