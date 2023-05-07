//
//  RegisterViewModel.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 8.05.2023.
//

import Foundation

/// The `RegisterViewModel` class is an `ObservableObject` responsible for handling the view model layer for the user registration process.
///
/// It provides functionality for registering a new user with email, password, first name, and last name.
class RegisterViewModel: ObservableObject {
    
    /// A string representing the user's email.
    @Published var email: String = ""
    
    /// A string representing the user's password.
    @Published var password: String = ""
    
    /// A string representing the user's first name.
    @Published var firstName: String = ""
    
    /// A string representing the user's last name.
    @Published var lastName: String = ""
    
    /// A boolean indicating whether the registration process is currently loading.
    @Published var isLoading: Bool = false
    
    /// A string representing an error message that occurred during the registration process.
    @Published var errorMessage: String = ""
    
    /// A boolean indicating whether the user has successfully registered.
    @Published var isRegistered: Bool = false
    
    /// An instance of `AuthApiClient` for making API calls related to authentication.
    private let authApiClient = AuthApiClient()
    
    /// Registers the user with the provided email, password, first name, and last name.
    ///
    /// In case of a successful registration, the `isRegistered` property is set to `true`.
    /// In case of an error, the error message is set to the `errorMessage` property.
    func register() {
        isLoading = true
        errorMessage = ""
        
        authApiClient.register(email: email, password: password, firstName: firstName, lastName: lastName) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let token):
                    self?.isRegistered = true
                    // Save token to secure storage or UserDefaults, depending on your requirements
                    print("Token: \(token.accessToken)")
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

