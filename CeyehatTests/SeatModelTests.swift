//
//  SeatModelTest.swift
//  CeyehatTests
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import XCTest
@testable import Ceyehat

class SeatTests: XCTestCase {
    
    func testSeatModel() {
        let seat = Seat(seatNumber: "1A", seatClass: 1, seatStatus: 0)
        
        XCTAssertEqual(seat.seatNumber, "1A")
        XCTAssertEqual(seat.seatClass, 1)
        XCTAssertEqual(seat.seatStatus, 0)
    }
}
