//
//  TicketViewModel.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 8.05.2023.
//

import Foundation

/// The `TicketViewModel` class is an `ObservableObject` responsible for handling the view model layer for creating flight tickets for multiple passengers.
///
/// It provides functionality for creating flight tickets for a list of passengers and storing the created tickets in an array.
class TicketViewModel: ObservableObject {
    
    /// An array containing the created `FlightTicket` objects for the passengers.
    @Published var flightTickets: [FlightTicket] = []
    
    /// A boolean indicating whether the ticket creation process is currently loading.
    @Published var isLoading: Bool = false
    
    /// An instance of `TicketApiClient` for making API calls related to flight tickets.
    private let ticketApiClient = TicketApiClient()
    
    /// Creates flight tickets for the specified passengers and stores them in the `flightTickets` array.
    ///
    /// - Parameters:
    ///   - passengers: An array of `Passenger` objects for which to create flight tickets.
    ///   - flightId: The flight ID for the flight that the passengers will be boarding.
    func createTickets(for passengers: [Passenger], flightId: String) {
        isLoading = true
        let group = DispatchGroup()
        
        for passenger in passengers {
            group.enter()
            ticketApiClient.createTicket(email: passenger.email, flightId: flightId) { result in
                switch result {
                case .success(let decodedTicket):
                    DispatchQueue.main.async {
                        self.flightTickets.append(decodedTicket)
                    }
                case .failure(let error):
                    print("Error creating ticket:", error)
                }
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            self.isLoading = false
        }
    }
}

