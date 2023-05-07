//
//  FlightTicketModelTest.swift
//  CeyehatTests
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import XCTest
@testable import Ceyehat

class FlightTicketTests: XCTestCase {
    
    func testFlightTicketModel() {
        let flightTicket = FlightTicket(id: "FT123", boardingPassId: "BP123", bookingId: "BK123")
        
        XCTAssertEqual(flightTicket.id, "FT123")
        XCTAssertEqual(flightTicket.boardingPassId, "BP123")
        XCTAssertEqual(flightTicket.bookingId, "BK123")
    }
}

