//
//  User.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 23.05.2023.
//

import Foundation

struct User: Hashable, Codable {
    let id: String
    let firstName: String
    let lastName: String
    let customerId: String
    
    init(id: String, firstName: String, lastName: String, customerId: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.customerId = customerId
    }
}
