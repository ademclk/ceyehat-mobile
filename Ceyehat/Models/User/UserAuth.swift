//
//  UserAuth.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import Foundation
import Combine

/// The `UserAuth` class is responsible for managing user authentication.
///
/// It holds the authentication token, updates it, and clears it when necessary.
class UserAuth: ObservableObject {
    @Published var user: User?
    @Published var bookings: [Booking]?
    @Published var flightTickets: [FlightTicket]?
    @Published private(set) var token: Token? {
        didSet {
            if let token = token {
                _ = KeychainWrapper().store("token", value: token.accessToken)
            } else {
                _ = KeychainWrapper().store("token", value: "")
            }
        }
    }
    
    init() {
        if let storedToken = KeychainWrapper().retrieve("token"), !storedToken.isEmpty {
            token = Token(accessToken: storedToken, expireDate: Date(), refreshToken: "")
        }
    }
    
    /// Updates the authentication token.
    ///
    /// - Parameters:
    ///   - token: The new `Token` object to be stored.
    func updateToken(_ token: Token, email: String) {
        self.token = token
        fetchUserInfo(email: email)
        fetchUserBookings(email: email)
        fetchUserTickets(email: email)
    }

    
    /// Clears the authentication token.
    func clearToken() {
        self.token = nil
    }
    
    /// Logs out the user by clearing the authentication token.
    func logout() {
        clearToken()
        // Additional logout-related tasks can be performed here, such as clearing user-specific data or resetting app state.
    }
    
    func fetchUserInfo(email: String) {
        guard let token = token else { return }
        
        let endpoint = URL(string: ApiEndpoints().getUserInfoUrl())!
        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        request.addValue("Bearer \(token.accessToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = ["email": email]
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            guard let data = data, error == nil else { return }
            
            if let user = try? JSONDecoder().decode(User.self, from: data) {
                DispatchQueue.main.async {
                    self?.user = user
                }
            }
        }
        .resume()
    }
    
    func fetchUserBookings(email: String) {
        guard let token = token else { return }
        
        let endpoint = URL(string: ApiEndpoints().getUserBookingsUrl())!
        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        request.addValue("Bearer \(token.accessToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = ["email": email]
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            guard let data = data, error == nil else { return }
            
            if let bookings = try? JSONDecoder().decode([Booking].self, from: data) {
                DispatchQueue.main.async {
                    self?.bookings = bookings
                }
            }
        }
        .resume()
    }
    
    func fetchUserTickets(email: String) {
        guard let token = token else { return }
        
        let endpoint = URL(string: ApiEndpoints().getUserTicketsUrl())!
        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        request.addValue("Bearer \(token.accessToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = ["email": email]
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            guard let data = data, error == nil else { return }
            
            if let tickets = try? JSONDecoder().decode([FlightTicket].self, from: data) {
                DispatchQueue.main.async {
                    self?.flightTickets = tickets
                }
            }
        }
        .resume()
    }
    
    /// Indicates whether the user is authenticated.
    var isAuthenticated: Bool {
        return token != nil
    }
}

