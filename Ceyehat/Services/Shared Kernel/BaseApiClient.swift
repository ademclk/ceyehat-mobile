//
//  BaseApiClient.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import Foundation

/// The `BaseApiClient` class is a base class for making API calls.
///
/// It includes a generic method for making an API call and decoding the response into the specified data type.
class BaseApiClient {
    
    /// Makes an API call and decodes the response into the specified data type.
    ///
    /// - Parameters:
    ///   - url: The URL for the API call.
    ///   - request: The URLRequest to be used for the API call.
    ///   - completion: The completion closure to be called when the API call is completed.
    /// - Returns: A decoded object of the specified data type or an error if the API call or decoding fails.
    func makeAPICall<T: Codable>(
        url: URL,
        request: URLRequest,
        completion: @escaping (Result<T, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(decodedData))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
        }
        task.resume()
    }
}

