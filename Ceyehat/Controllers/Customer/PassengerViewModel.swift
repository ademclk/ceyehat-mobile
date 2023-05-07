//
//  PassengerViewModel.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 8.05.2023.
//

import Foundation

/// The `PassengerViewModel` class is an `ObservableObject` responsible for handling the view model layer for sending passenger information to the server.
///
/// It provides functionality for sending a `Passenger` object to the server and receiving a success status.
class PassengerViewModel: ObservableObject {
    
    /// A boolean indicating whether the passenger information submission process is currently loading.
    @Published var isLoading = false
    
    /// An instance of `PassengerApiClient` for making API calls related to passenger information.
    private let passengerApiClient = PassengerApiClient()
    
    /// Sends the passenger information to the server.
    ///
    /// - Parameters:
    ///   - passenger: The `Passenger` object containing the passenger information to be sent.
    ///   - completion: The completion closure to be called when the API call is completed. The closure takes a boolean argument, which is `true` if the passenger information was sent successfully and `false` otherwise.
    func sendPassengerToServer(passenger: Passenger, completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        passengerApiClient.sendPassengerToServer(passenger: passenger) { success in
            DispatchQueue.main.async {
                self.isLoading = false
            }
            completion(success)
        }
    }
}

