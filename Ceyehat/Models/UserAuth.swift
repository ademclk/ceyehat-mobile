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
    @Published private(set) var token: Token? = nil
    
    /// Updates the authentication token.
    ///
    /// - Parameters:
    ///   - token: The new `Token` object to be stored.
    func updateToken(_ token: Token) {
        self.token = token
    }
    
    /// Clears the authentication token.
    func clearToken() {
        self.token = nil
    }
    
    /// Indicates whether the user is authenticated.
    var isAuthenticated: Bool {
        return token != nil
    }
}

