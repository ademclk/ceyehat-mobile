//
//  Booking.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 3.06.2023.
//

import Foundation

struct Booking: Hashable, Codable {
    let bookingId: String
    let seatId: String?
    let seatNumber: String?
    let flightId: String
    let flightNumber: String
    let currency: String
    let price: Float
    var passengerType: String
    
    init(bookingId: String, seatId: String?, seatNumber: String?, flightId: String, flightNumber: String, currency: String, price: Float, passengerType: String) {
        self.bookingId = bookingId
        self.seatId = seatId
        self.seatNumber = seatNumber
        self.flightId = flightId
        self.flightNumber = flightNumber
        self.currency = currency
        self.price = price
        self.passengerType = passengerType
    }
}
