//
//  LoginViewModel.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 8.05.2023.
//

import Foundation

/// The `LoginViewModel` class is an `ObservableObject` responsible for handling the view model layer for the login process.
///
/// It provides functionality for logging in a user with email and password.
class LoginViewModel: ObservableObject {
    
    /// A string representing the user's email.
    @Published var email: String = ""
    
    /// A string representing the user's password.
    @Published var password: String = ""
    
    /// An instance of `AuthApiClient` for making API calls related to authentication.
    private var authApiClient = AuthApiClient()
    
    /// Logs in the user with the provided email and password.
    ///
    /// - Parameter completion: The completion closure to be called when the login API call is completed.
    ///
    /// In case of success, a `Token` object is returned, and in case of an error, the error is returned.
    func login(completion: @escaping(Result<Token, Error>) -> Void) {
        authApiClient.login(email: email, password: password, completion: completion)
    }
}

