//
//  TicketModelTest.swift
//  CeyehatTests
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import XCTest
@testable import Ceyehat

class TicketTests: XCTestCase {
    
    func testTicketModel() {
        let ticket = Ticket(email: "john.doe@example.com", flightId: "AA123")
        
        XCTAssertEqual(ticket.email, "john.doe@example.com")
        XCTAssertEqual(ticket.flightId, "AA123")
    }
}
