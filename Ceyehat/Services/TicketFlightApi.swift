//
//  TicketFlightApi.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import Foundation

/// The `TicketApiClient` class handles the API calls related to tickets.
///
/// It inherits from the `BaseApiClient` class and provides a method for creating tickets.
class TicketApiClient: BaseApiClient {
    
    /// Creates a ticket for a given email address and flight ID.
    ///
    /// - Parameters:
    ///   - email: The email address of the user as a string.
    ///   - flightId: The flight ID as a string.
    ///   - completion: The completion closure to be called when the API call is completed.
    /// - Returns: A `FlightTicket` object or an error if the API call or decoding fails.
    func createTicket(email: String, flightId: String, completion: @escaping (Result<FlightTicket, Error>) -> Void) {
        guard let url = URL(string: ApiEndpoints().createTicketUrl()) else {
            return
        }
        
        let ticket = Ticket(email: email, flightId: flightId)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(ticket)
        } catch let error {
            print("Error encoding ticket:", error)
            return
        }
        
        makeAPICall(url: url, request: request) { (result: Result<FlightTicket, Error>) in
            completion(result)
        }
    }
}

