//
//  FlightTicket.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import Foundation

/// The `FlightTicket` model represents a flight ticket with an associated ID.
///
/// It includes the ticket's unique ID, an optional boarding pass ID, and an optional booking ID.
struct FlightTicket: Hashable, Codable, Identifiable {
    var id: String
    var boardingPassId: String?
    var bookingId: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case boardingPassId
        case bookingId
    }
}

