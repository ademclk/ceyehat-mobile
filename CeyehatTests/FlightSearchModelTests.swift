//
//  FlightSearchModelTest.swift
//  CeyehatTests
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import XCTest
@testable import Ceyehat

class FlightSearchTests: XCTestCase {
    
    func testFlightSearchModel() {
        let flightSearch = FlightSearch(departureAirportIataCode: "JFK", arrivalAirportIataCode: "LAX", departureDate: "2023-05-15", returnDate: "2023-05-20", passengerCount: 2)
        
        XCTAssertEqual(flightSearch.departureAirportIataCode, "JFK")
        XCTAssertEqual(flightSearch.arrivalAirportIataCode, "LAX")
        XCTAssertEqual(flightSearch.departureDate, "2023-05-15")
        XCTAssertEqual(flightSearch.returnDate, "2023-05-20")
        XCTAssertEqual(flightSearch.passengerCount, 2)
    }
}

