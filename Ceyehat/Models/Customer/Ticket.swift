//
//  Ticket.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import Foundation

/// The `Ticket` model represents a flight ticket.
///
/// It includes the email address of the ticket holder and the flight ID.
struct Ticket: Hashable, Codable {
    var email: String
    var flightId: String
}

