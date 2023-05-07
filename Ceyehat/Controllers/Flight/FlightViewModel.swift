//
//  FlightViewModel.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import Foundation

/// The `FlightViewModel` class is responsible for managing the state and interactions related to flights.
///
/// This includes fetching flights, managing the selection of flights and prices, and handling seat reservations.
class FlightViewModel: ObservableObject {
    @Published var flights: [Flight] = []
    @Published var selectedFlight: Flight?
    @Published var selectedPrice: Double?
    @Published var showFlightPriceSheet = false
    @Published var seatViewModel = SeatViewModel()
    
    private let flightApiClient = FlightApiClient()
    
    /// Selects a flight and sets the `showFlightPriceSheet` property to true.
    ///
    /// - Parameter flight: The flight to be selected.
    func selectFlight(_ flight: Flight) {
        selectedFlight = flight
        showFlightPriceSheet = true
    }
    
    /// Searches for flights based on the provided parameters.
    ///
    /// - Parameters:
    ///   - departureAirportIataCode: The IATA code of the departure airport.
    ///   - arrivalAirportIataCode: The IATA code of the arrival airport.
    ///   - departureDate: The date of departure.
    ///   - returnDate: The optional return date. If not provided, it will be set to nil.
    ///   - passengerCount: The number of passengers.
    func searchFlights(departureAirportIataCode: String, arrivalAirportIataCode: String, departureDate: Date, returnDate: Date?, passengerCount: Int) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let flightSearch = FlightSearch(departureAirportIataCode: departureAirportIataCode, arrivalAirportIataCode: arrivalAirportIataCode, departureDate: dateFormatter.string(from: departureDate), returnDate: returnDate != nil ? dateFormatter.string(from: returnDate!) : nil, passengerCount: passengerCount)
        
        flightApiClient.searchFlights(flightSearch: flightSearch) { [weak self] result in
            switch result {
            case .success(let flights):
                DispatchQueue.main.async {
                    self?.flights = flights
                }
            case .failure(let error):
                print("Flight decoding failed: \(error.localizedDescription)")
            }
        }
    }
}

