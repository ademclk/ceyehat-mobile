//
//  BookingModelTest.swift
//  CeyehatTests
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import XCTest
@testable import Ceyehat

class BookingTests: XCTestCase {
    
    func testBookingInitialization() {
        let booking = Booking(seatId: "12A", flightId: "12345", price: 500.0, currency: "USD", passengerType: "Adult")
        
        XCTAssertEqual(booking.seatId, "12A")
        XCTAssertEqual(booking.flightId, "12345")
        XCTAssertEqual(booking.price, 500.0)
        XCTAssertEqual(booking.currency, "USD")
        XCTAssertEqual(booking.passengerType, "Adult")
    }
}

