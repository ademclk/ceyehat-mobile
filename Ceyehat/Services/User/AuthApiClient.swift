//
//  AuthApiClient.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import Foundation

/// The `AuthApiClient` class handles the API calls related to authentication.
///
/// It inherits from the `BaseApiClient` class and provides methods for logging in and registering users.
class AuthApiClient: BaseApiClient {
    
    /// Logs in a user with the provided email and password.
    ///
    /// - Parameters:
    ///   - email: The user's email address.
    ///   - password: The user's password.
    ///   - completion: The completion closure to be called when the API call is completed.
    /// - Returns: A `Token` object or an error if the API call or decoding fails.
    func login(
        email: String,
        password: String,
        completion: @escaping (Result<Token, Error>) -> Void) {
        let loginRequest = LoginRequest(email: email, password: password)
        guard let url = URL(string: ApiEndpoints().getLoginUrl()) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(loginRequest)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let token = try JSONDecoder().decode(Token.self, from: data)
                    completion(.success(token))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }

    
    /// Registers a new user with the provided email, password, first name, and last name.
    ///
    /// - Parameters:
    ///   - email: The user's email address.
    ///   - password: The user's password.
    ///   - firstName: The user's first name.
    ///   - lastName: The user's last name.
    ///   - completion: The completion closure to be called when the API call is completed.
    /// - Returns: A `Token` object or an error if the API call or decoding fails.
    func register(
        email: String,
        password: String,
        firstName: String,
        lastName: String,
        completion: @escaping (Result<Token, Error>) -> Void) {
        let registerRequest = RegisterRequest(email: email, password: password, firstName: firstName, lastName: lastName)
        guard let url = URL(string: ApiEndpoints().getRegisterUrl()) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(registerRequest)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let token = try JSONDecoder().decode(Token.self, from: data)
                    completion(.success(token))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}

