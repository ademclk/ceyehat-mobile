//
//  PassengerApiClient.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import Foundation

/// The `PassengerApiClient` class handles the API calls related to passengers.
///
/// It inherits from the `BaseApiClient` class and provides a method for sending passenger information to the server.
class PassengerApiClient: BaseApiClient {
    
    /// Sends the passenger information to the server.
    ///
    /// - Parameters:
    ///   - passenger: The `Passenger` object containing the passenger information.
    ///   - completion: The completion closure to be called when the API call is completed.
    /// - Returns: A boolean value indicating whether the operation was successful or not.
    func sendPassengerToServer(passenger: Passenger, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: ApiEndpoints().addPassengerUrl()) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let passengerData = passenger.toRequestFormat()
        let payload = try? JSONSerialization.data(withJSONObject: passengerData, options: [])
        
        print("Payload: \(String(data: payload!, encoding: .utf8) ?? "")")
        
        request.httpBody = payload
        
        makeAPICall(url: url, request: request) { (result: Result<Data, Error>) in
            switch result {
            case .success(let data):
                print("Successfully added passenger: \(String(data: data, encoding: .utf8) ?? "")")
                completion(true)
            case .failure(let error):
                print("Error: \(error)")
                completion(false)
            }
        }
    }
}

