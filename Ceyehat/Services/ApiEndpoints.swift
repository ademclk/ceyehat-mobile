//
//  ApiEndpoints.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import Foundation

/// The `ApiEndpoints` struct provides a collection of API endpoints for the application.
struct ApiEndpoints {
    static let BASE_URL = "http://localhost:5228/api/"
    static let GET_AIRPORTS = "Airport/search"
    static let SEARCH_AIRPORTS = "Airport/search?searchTerm="
    static let SEARCH_FLIGHTS = "Flight/search"
    static let POST_CUSTOMER = "Customer/"
    static let ADD_PASSENGER = "Customer/add-passenger"
    static let CREATE_TICKET = "Customer/create-ticket"
    static let GET_SEATS = "Seat/"
    static let LOGIN = "auth/login"
    static let REGISTER = "auth/register"
    
    /// Returns the URL for getting the airports.
    func getAirportUrl() -> String {
        return ApiEndpoints.BASE_URL + ApiEndpoints.GET_AIRPORTS
    }
    
    /// Returns the URL for searching airports by a search term.
    ///
    /// - Parameter searchTerm: The search term for finding airports.
    /// - Returns: The URL for searching airports.
    func searchAirportUrl(searchTerm: String) -> String {
        return ApiEndpoints.BASE_URL + ApiEndpoints.SEARCH_AIRPORTS + "\(searchTerm)"
    }
    
    /// Returns the URL for searching flights.
    func searchFlightUrl() -> String {
        return ApiEndpoints.BASE_URL + ApiEndpoints.SEARCH_FLIGHTS
    }
    
    /// Returns the URL for saving a customer.
    func saveCustomerUrl() -> String {
        return ApiEndpoints.BASE_URL + ApiEndpoints.POST_CUSTOMER
    }
    
    /// Returns the URL for adding a passenger.
    func addPassengerUrl() -> String {
        return ApiEndpoints.BASE_URL + ApiEndpoints.ADD_PASSENGER
    }
    
    /// Returns the URL for creating a ticket.
    func createTicketUrl() -> String {
        return ApiEndpoints.BASE_URL + ApiEndpoints.CREATE_TICKET
    }
    
    /// Returns the URL for getting seats for a specific flight.
    ///
    /// - Parameters:
    ///   - flightNumber: The flight number.
    ///   - aircraftName: The name of the aircraft.
    /// - Returns: The URL for getting seats.
    func getSeatUrl(flightNumber: String, aircraftName: String) -> String {
        return ApiEndpoints.BASE_URL + ApiEndpoints.GET_SEATS + flightNumber + "/" + aircraftName
    }
    
    /// Returns the URL for the login endpoint.
    func getLoginUrl() -> String {
        return ApiEndpoints.BASE_URL + ApiEndpoints.LOGIN
    }
    
    /// Returns the URL for the register endpoint.
    func getRegisterUrl() -> String {
        return ApiEndpoints.BASE_URL + ApiEndpoints.REGISTER
    }
}

