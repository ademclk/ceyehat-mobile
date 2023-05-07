//
//  Seat.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import Foundation

/// The `Seat` model represents a seat on an aircraft.
///
/// Each seat has a seat number, seat class, and seat status.
struct Seat: Hashable, Codable {
    let seatNumber: String
    let seatClass: Int
    let seatStatus: Int
    
    /// Initializes a new instance of the `Seat` model.
    ///
    /// - Parameters:
    ///   - seatNumber: The seat number.
    ///   - seatClass: The class of the seat (e.g., 1 for economy, 2 for comfort, 3 for business).
    ///   - seatStatus: The status of the seat (e.g., 0 for available, 1 for occupied, 2 for reserved).
    init(seatNumber: String, seatClass: Int, seatStatus: Int) {
        self.seatNumber = seatNumber
        self.seatClass = seatClass
        self.seatStatus = seatStatus
    }
}

