//
//  Booking.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import Foundation

/// The `Booking` model represents a single booking.
///
/// Each booking has a seat ID, flight ID, price, currency, and passenger type.
struct Booking: Hashable, Codable {
    var seatId: String?
    var flightId: String
    var price: Double
    var currency: String
    var passengerType: String
}

