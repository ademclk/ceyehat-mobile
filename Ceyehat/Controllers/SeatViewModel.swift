//
//  SeatViewModel.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 8.05.2023.
//

import Foundation

/// The `SeatViewModel` class is an `ObservableObject` responsible for handling the view model layer related to seat selection.
///
/// It provides functionality for searching for available seats on a flight and storing the result in an array.
class SeatViewModel: ObservableObject {
    
    /// An array containing the available `Seat` objects for a flight.
    @Published var seats: [Seat] = []
    
    /// The selected `SeatType` for the user. Defaults to `.economy`.
    @Published var selectedSeatType: SeatType = .economy
    
    /// An instance of `SeatApiClient` for making API calls related to seat selection.
    private let seatApiClient = SeatApiClient()
    
    /// Searches for available seats on a flight with the specified flight number and aircraft name.
    ///
    /// - Parameters:
    ///   - flightNumber: The flight number of the desired flight.
    ///   - aircraftName: The name of the aircraft for the desired flight.
    func searchSeat(flightNumber: String, aircraftName: String) {
        seatApiClient.fetchSeats(flightNumber: flightNumber, aircraftName: aircraftName) { [weak self] result in
            switch result {
            case .success(let seats):
                DispatchQueue.main.async {
                    self?.seats = seats.sorted { $0.seatNumber < $1.seatNumber }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

