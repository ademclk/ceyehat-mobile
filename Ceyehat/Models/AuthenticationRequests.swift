//
//  AuthenticationRequests.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import Foundation

/// The `LoginRequest` model represents a login request.
///
/// It includes the user's email address and password.
struct LoginRequest: Codable {
    var email: String
    var password: String
}

/// The `RegisterRequest` model represents a registration request.
///
/// It includes the user's email address, password, first name, and last name.
struct RegisterRequest: Codable {
    var email: String
    var password: String
    var firstName: String
    var lastName: String
}
