//
//  Token.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import Foundation

/// The `Token` model represents an access token, its expiration date, and a refresh token.
///
/// It is typically used for authentication and authorization purposes in API communication.
struct Token: Codable {
    var accessToken: String
    var expireDate: Date
    var refreshToken: String
    
    private enum CodingKeys: String, CodingKey {
        case accessToken, expireDate, refreshToken
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accessToken = try container.decode(String.self, forKey: .accessToken)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let expireDateString = try container.decode(String.self, forKey: .expireDate)
        expireDate = dateFormatter.date(from: expireDateString)!
        
        self.refreshToken = try container.decode(String.self, forKey: .refreshToken)
    }
    
    /// Initializes a new instance of the `Token` model.
    ///
    /// - Parameters:
    ///   - accessToken: The access token string.
    ///   - expireDate: The expiration date of the access token.
    ///   - refreshToken: The refresh token string.
    init(accessToken: String, expireDate: Date, refreshToken: String) {
        self.accessToken = accessToken
        self.expireDate = expireDate
        self.refreshToken = refreshToken
    }
}

